using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using PlayerIO.GameLibrary;
using System.Drawing;

namespace MyGame {
	public class Player : BasePlayer {
		public string Name;
        public bool leftGame = false;
	}

    [RoomType("BOTPLAY")]
	public class BotCode : GameCode {
        public override void init()
        {
                 int min = 3 * 800;
                 int max = 7 * 800;

                 Random rnd = new Random();
                 int distance = rnd.Next(min, max - 1);
                 int leftOffset = rnd.Next(0, 800 - 1);
                 Broadcast("SpaceUsers", leftOffset, distance, p1Name, "computer");
                 Broadcast("shoot", playerTurn);
                 timerStopped = false;
         }
    }


	[RoomType("PVP")]
	public class GameCode : Game<Player> {
        public bool isSolo = true;
        public bool startAllowed = false;
        public uint playerTurn = 1;
        public String p1Name = "computer";
        public String p2Name = "computer";

        public int timer = 30;
        public bool timerStopped = true;
        public bool gameActive = true;

        public Object pvpLock = new Object();

		// This method is called when an instance of your the game is created
		public override void GameStarted() {
			// anything you write to the Console will show up in the 
			// output window of the development server
			Console.WriteLine("Game is started: " + RoomId);

			// This is how you setup a timer
			AddTimer(delegate {
				// code here will code every second
                if (!timerStopped)
                {
                    if (timer < 0)
                    {
                        changeShooter();
                    }

                   Broadcast("UpdateTimer", timer);

                   timer--;
                }

			}, 1000);
			
			// Debug Example:
			// Sometimes, it can be very usefull to have a graphical representation
			// of the state of your game.
			// An easy way to accomplish this is to setup a timer to update the
			// debug view every 250th second (4 times a second).
			AddTimer(delegate {
				// This will cause the GenerateDebugImage() method to be called
				// so you can draw a grapical version of the game state.
				RefreshDebugView(); 
			}, 250);
		}

		// This method is called when the last player leaves the room, and it's closed down.
		public override void GameClosed() {
			Console.WriteLine("RoomId: " + RoomId);
		}

		// This method is called whenever a player joins the game
		public override void UserJoined(Player player) {
            lock (pvpLock)
            {
                if (PlayerCount > 2)
                {
                    player.Send("RoomFull");
                    player.Disconnect();
                    return;
                }

                // this is how you send a player a message
                player.Send("getID", player.Id);

                // this is how you broadcast a message to all players connected to the game
                Broadcast("UserJoined", player.Id);
            }
		}

        public virtual void init()
        {
            if (PlayerCount == 2)
            {
                isSolo = false;
                int min = 3 * 800;
                int max = 7 * 800;

                Random rnd = new Random();
                int distance = rnd.Next(min, max - 1);
                int leftOffset = rnd.Next(0, 800 - 1);
                Broadcast("SpaceUsers", leftOffset, distance, p1Name, p2Name);
                Broadcast("shoot", playerTurn);
                timerStopped = false;

           }
        }

		// This method is called when a player leaves the game
		public override void UserLeft(Player player) {
            isSolo = true;
            player.leftGame = true;

            switch (player.Id)
            {
                case 1:
                    Broadcast("UserLeft", player.Id, "computer", p2Name, playerTurn);
                    break;
                case 2:
                    Broadcast("UserLeft", player.Id, p1Name, "computer", playerTurn);
                    break;
                default:
                    return;
            }


		}

		// This method is called when a player sends a message into the server code
		public override void GotMessage(Player player, Message message) {
			switch(message.Type) {
				// This is how you would set a players name when they send in their name in a 
				// "MyNameIs" message
				case "MyNameIs":
                    switch (player.Id)
                    {
                        case 1:
                            p1Name = message.GetString(0);
                            break;
                        case 2:
                            p2Name = message.GetString(0);
                            break;
                    }

                    init();
					break;
                case "SendChat":
                    Broadcast("GetChat", message.GetString(0), player.Id);
                    break;
                case "ShotMade":
                    timerStopped = true;
                    float angle = message.GetFloat(0);
                    float mag = message.GetFloat(1);

                    Broadcast("receiveShot", playerTurn, angle, mag);
               
                    break;
                case "FinishedShot":
                    
                    changeShooter();
                    break;

                case "GameOver":
                    gameActive = false;
                    break;
                case "Rematch":
                     String newRoomID = MatchMakingCode.randomString(20);

                     foreach (Player guy in Players)
                     {
                         if (!guy.leftGame)
                         {
                             guy.Send("RecieveRematch", newRoomID);
                         }
                     }
                    break;
			}
		}

        public void changeShooter()
        {
            if (gameActive)
            {
                timer = 30; // reset the timer
                Broadcast("UpdateTimer", timer);

                toggleTurn();
                Broadcast("shoot", playerTurn);

                timerStopped = false;
            }
        }

        public Player getPlayer(int num)
        {
            int count = 1;
            
            foreach (Player p in Players)
            {
                if (num == count)
                {
                    return p;
                }

                count++;
            }

            return null;
        }

        public void toggleTurn()
        {
            switch (playerTurn)
            {
                case 1:
                    playerTurn = 2;
                    break;
                case 2:
                    playerTurn = 1;
                    break;
            }
        }

		Point debugPoint;

		// This method get's called whenever you trigger it by calling the RefreshDebugView() method.
		public override System.Drawing.Image GenerateDebugImage() {
			// we'll just draw 400 by 400 pixels image with the current time, but you can
			// use this to visualize just about anything.
			var image = new Bitmap(400,400);
			using(var g = Graphics.FromImage(image)) {
				// fill the background
				g.FillRectangle(Brushes.Blue, 0, 0, image.Width, image.Height);

				// draw the current time
				g.DrawString(DateTime.Now.ToString(), new Font("Verdana",20F),Brushes.Orange, 10,10);

				// draw a dot based on the DebugPoint variable
				g.FillRectangle(Brushes.Red, debugPoint.X,debugPoint.Y,5,5);
			}
			return image;
		}

		// During development, it's very usefull to be able to cause certain events
		// to occur in your serverside code. If you create a public method with no
		// arguments and add a [DebugAction] attribute like we've down below, a button
		// will be added to the development server. 
		// Whenever you click the button, your code will run.
		[DebugAction("Play", DebugAction.Icon.Play)]
		public void PlayNow() {
			Console.WriteLine("The play button was clicked!");
		}

		// If you use the [DebugAction] attribute on a method with
		// two int arguments, the action will be triggered via the
		// debug view when you click the debug view on a running game.
		[DebugAction("Set Debug Point", DebugAction.Icon.Green)]
		public void SetDebugPoint(int x, int y) {
			debugPoint = new Point(x,y);
		}
	}

    [RoomType("QUICK")]
    public class MatchMakingCode : Game<Player>
    {
        public Object quickLock = new Object();

        // This method is called when an instance of your the game is created
        public override void GameStarted()
        {
            // anything you write to the Console will show up in the 
            // output window of the development server
            Console.WriteLine("Game is started: " + RoomId);

            // This is how you setup a timer
            AddTimer(delegate
            {
                // code here will code every second

            }, 1000);

            // Debug Example:
            // Sometimes, it can be very usefull to have a graphical representation
            // of the state of your game.
            // An easy way to accomplish this is to setup a timer to update the
            // debug view every 250th second (4 times a second).
            AddTimer(delegate
            {
                // This will cause the GenerateDebugImage() method to be called
                // so you can draw a grapical version of the game state.
                RefreshDebugView();
            }, 250);
        }

        // This method is called when the last player leaves the room, and it's closed down.
        public override void GameClosed()
        {
            Console.WriteLine("RoomId: " + RoomId);
        }

        // This method is called whenever a player joins the game
        public override void UserJoined(Player player)
        {
            lock (quickLock)
            {
                if (PlayerCount == 2)
                {
                    String roomID = randomString(20);

                     foreach (Player guy in Players)
                     {
                         if (!guy.leftGame)
                         {
                             guy.Send("FoundMatch", roomID);
                         }
                     }
                }
            }
        }

        // This method is called when a player leaves the game
        public override void UserLeft(Player player)
        {
            lock (quickLock)
            {
                player.leftGame = true;
            }
        }

        // This method is called when a player sends a message into the server code
        public override void GotMessage(Player player, Message message)
        {
            switch (message.Type)
            {
                // This is how you would set a players name when they send in their name in a 
                // "MyNameIs" message
                case "MyNameIs":
                    break;
            }
        }

        public static string randomString(int length)
        {
            string allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
            char[] chars = new char[length];
            Random random = new Random();

            for (int i = 0; i < length; i++)
            {
                chars[i] = allowedChars[random.Next(0, allowedChars.Length)];
            }

            return new string(chars);
        }

        Point debugPoint2;

        // This method get's called whenever you trigger it by calling the RefreshDebugView() method.
        public override System.Drawing.Image GenerateDebugImage()
        {
            // we'll just draw 400 by 400 pixels image with the current time, but you can
            // use this to visualize just about anything.
            var image = new Bitmap(400, 400);
            using (var g = Graphics.FromImage(image))
            {
                // fill the background
                g.FillRectangle(Brushes.Blue, 0, 0, image.Width, image.Height);

                // draw the current time
                g.DrawString(DateTime.Now.ToString(), new Font("Verdana", 20F), Brushes.Orange, 10, 10);

                // draw a dot based on the DebugPoint variable
                g.FillRectangle(Brushes.Red, debugPoint2.X, debugPoint2.Y, 5, 5);
            }
            return image;
        }

        // During development, it's very usefull to be able to cause certain events
        // to occur in your serverside code. If you create a public method with no
        // arguments and add a [DebugAction] attribute like we've down below, a button
        // will be added to the development server. 
        // Whenever you click the button, your code will run.
        [DebugAction("Play", DebugAction.Icon.Play)]
        public void PlayNow()
        {
            Console.WriteLine("The play button was clicked!");
        }

        // If you use the [DebugAction] attribute on a method with
        // two int arguments, the action will be triggered via the
        // debug view when you click the debug view on a running game.
        [DebugAction("Set Debug Point", DebugAction.Icon.Green)]
        public void SetDebugPoint(int x, int y)
        {
            debugPoint2 = new Point(x, y);
        }
    }
}
