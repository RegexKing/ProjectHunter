package;

import flixel.*;
import flixel.effects.particles.FlxEmitterExt;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.tweens.FlxTween;
import flixel.util.FlxPoint;
import haxe.Timer;
import playerio.*;
import flixel.addons.api.FlxKongregate;
import com.newgrounds.API;
import flixel.addons.api.FlxGameJolt;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var conn:Connection;
	
	private var roomID:String = "testRoom";
	private var gameType:String = "PVP";
	private var isSolo:Bool = true; //flag for solo play
	private var isLocal:Bool = false;
	private var ranked:Bool = false;
	
	private var client:Client;
	private var arrows:FlxGroup;
	private var playerArrows:FlxGroup;
	private var enemyArrows:FlxGroup;
	private var bow:Bow;
	private var hud:Hud;
	private var tracker:FlxObject;
	
	private var leftPlayer:Player;
	private var rightPlayer:Player;
	private var myPlayer:Player = null;
	private var enemyPlayer:Player = null;
	private var gibs:FlxEmitterExt;
	private var arrowHitboxes:FlxGroup;
	
	public function new(_client:Client, _gameType:String, _roomID:String, _isLocal:Bool = false, _ranked:Bool = false)
	{
		client = _client;
		
		roomID = _roomID;
		gameType = _gameType;
		
		if (gameType == "PVP")
			isSolo = false;
			
		isLocal = _isLocal;
		ranked = _ranked;
		
		super();
	}
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		
				
		super.create();

		var bg:Background = new Background();
		
		tracker = new FlxObject();
		
		arrows = new FlxGroup();
		playerArrows = new FlxGroup();
		enemyArrows = new FlxGroup();
		arrowHitboxes = new FlxGroup();
		arrowHitboxes.add(playerArrows);
		arrowHitboxes.add(enemyArrows);
		
		
		leftPlayer = new Player(1);
		leftPlayer.x = FlxG.width / 2 - leftPlayer.width / 2;
		leftPlayer.visible = false;
		
		rightPlayer = new Player(2);
		rightPlayer.x = leftPlayer.x + rightPlayer.width;
		rightPlayer.visible = false;
		
		hud = new Hud(leftPlayer, rightPlayer, isSolo || isLocal);
		bow = new Bow(hud);
		
		gibs = new FlxEmitterExt();
		gibs.setMotion(180, 5, 0, -180, 100);
		gibs.gravity = 800;
		
		for (i in 0...250)
		{
			gibs.add(new BloodParticle());
		}
		
		//gibs.makeParticles(AssetPaths.blood__png, 80, 180, true, 0.5);
		
		FlxG.worldBounds.width = 6 * 450 + (leftPlayer.x);
		
		FlxG.camera.follow(tracker);
		
		
		add(tracker);
		add(bg);
		add(leftPlayer);
		add(rightPlayer);
		add(gibs);
		add(bow);
		add(arrows);
		add(bow.arrow);
		add(arrowHitboxes);
		add(bg.midPlus);
		add(hud);
		
		handleConnection();
	}
	
	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		FlxG.overlap(myPlayer, enemyArrows, arrowHit);
		FlxG.overlap(enemyPlayer, playerArrows, arrowHit);
		FlxG.overlap(myPlayer, playerArrows, friendlyFire);
		FlxG.overlap(enemyPlayer, enemyArrows, friendlyFire);
		
	}
	
	private function friendlyFire(Object1:FlxObject, Object2:FlxObject):Void
	{
		if (!FlxMath.pointInCoordinates(Object2.getMidpoint().x, Object2.getMidpoint().y, Object1.x, Object1.y, Object1.width, Object1.height))
		{
			return;
		}
		
		if (Object2.y < Object1.y && Object2.angle >= 0 && Object2.angle <= 180)
		{
			
			Object1.hurt(5);
			
			gibs.x = Object2.getMidpoint().x;
			gibs.y = Object2.getMidpoint().y;
			gibs.start(true, 0, 0, 32);
			
			Object2.kill();
				
			FlxG.camera.shake(0.02, 0.2);
			
			checkGameOver(Object1, Object2);
			
			//Shot Self achieve
			if (Object1 == myPlayer)
			{
				FlxKongregate.submitStats("Shot Self", 1);
				API.unlockMedal("Masochist");
				FlxGameJolt.addTrophy(28838);
			}
		}
	}
	
	private function arrowHit(Object1:FlxObject, Object2:FlxObject):Void
	{
			if (!FlxMath.pointInCoordinates(Object2.getMidpoint().x, Object2.getMidpoint().y, Object1.x, Object1.y, Object1.width, Object1.height))
			{
				return;
			}
			
				gibs.x = Object2.getMidpoint().x;
				gibs.y = Object2.getMidpoint().y;
				
				if (Object2.getMidpoint().y > Object1.y + 98)
				{
					Object1.hurt(2);
					
					gibs.start(true, 0, 0, 8);
				}
				else if (Object2.getMidpoint().y > Object1.y + 38)
				{
					Object1.hurt(3);
					gibs.start(true, 0, 0, 16);
				}
				else
				{
					Object1.hurt(5);
					gibs.start(true, 0, 0, 32);
					FlxG.sound.play(AssetPaths.headshot__mp3);
					
					if (Object1 != myPlayer)
					{
						//headshot achieve
						FlxKongregate.submitStats("Headshots", 1);
						API.unlockMedal("Headshot!");
						FlxGameJolt.addTrophy(28827);
						Reg.writeSave("Headshots");
					}
				}
				
				Object2.kill();
				
				FlxG.camera.shake(0.02, 0.2);
				
				checkGameOver(Object1, Object2);
				
				if (Object1 != myPlayer)
					{
						//hits achieve
						FlxKongregate.submitStats("Hits", 1);
						Reg.writeSave("Hits");
					}
	}
	
	private function checkGameOver(Object1:FlxObject, Object2:FlxObject)
	{
				if (!Object1.solid)
				{
					conn.send("GameOver");
					
					if (Object1 == myPlayer)
					{
						
						myPlayer.animation.play("lose");
						enemyPlayer.animation.play("win");
						
						//losses achieve
						FlxKongregate.submitStats("Losses", 1);
						
						if (ranked)
						{
							API.unlockMedal("Consolation Prize");
							FlxGameJolt.addTrophy(28836);
						}
					}
					
					else if (Object1 == enemyPlayer)
					{
						myPlayer.animation.play("win");
						enemyPlayer.animation.play("lose");
						
						//ranked match achieve
						if (ranked)
						{
							FlxKongregate.submitStats("Ranked Match Wins", 1);
							API.unlockMedal("Winner!");
							FlxGameJolt.addTrophy(28829);
							Reg.writeSave("Ranked Match Wins");
						}
					}
					
					gibs.start(true, 0, 0, 100);
					
					trace(Object1 == leftPlayer);
					
					if (Object1 == leftPlayer)
						hud.header.text = hud.rightName.text + " Wins!";	
					else
						hud.header.text = hud.leftName.text + " Wins!";	
						
						
					eraseArrows(arrows);
					
					hud.killHud();
					hud.header.visible = true;
					
					//ranked matches played achieve
					if (ranked)
					{
						FlxKongregate.submitStats("Ranked Matches Played", 1);
						
						API.unlockMedal("The Dust Settles");
						FlxGameJolt.addTrophy(28828);
					}
				}
	}
	
	private function eraseArrows(arrowGrp:FlxGroup)
	{
		for (i in 0...arrowGrp.members.length)
				{
					var arrow:Arrow = cast(arrowGrp.members[i], Arrow);
					if (arrow.hasHit)
					{
						arrow.visible = false;
					}
				}
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{		
		BotMem.resetCounter();
			
		super.destroy();
	}
	
	private function handleConnection()
	{
		 trace("Sucessfully connected to player.io");
         
         //Set developmentsever (Comment out to connect to your server online)
        if (Reg.isDebug) client.multiplayer.developmentServer = "localhost:8184";
         
         //Create pr join the room test
         client.multiplayer.createJoinRoom(
            roomID,                        //Room id. If set to null a random roomid is used
            gameType,                     //The game type started on the server
            true,                        //Should the room be visible in the lobby?
            {},                           //Room data. This data is returned to lobby list. Variabels can be modifed on the server
            {},                           //User join data
            handleJoin,                     //Function executed on successful joining of the room
            handleError                     //Function executed if we got a join error
         );
	}
	
	private function aimBot()
	{
		var botAim:FlxPoint = GameUtil.calcAim(myPlayer.getMidpoint().x - enemyPlayer.getMidpoint().x, myPlayer.getMidpoint().y - enemyPlayer.getMidpoint().y, GameUtil.randRange(1.2, 2.2));
		
		if (conn != null)
			conn.send("ShotMade", botAim.x, botAim.y + BotMem.getMagScaler());
					
		botAim.put();
	}
	
	private function handleJoin(connection:Connection)
	{
		trace("Sucessfully connected to the multiplayer server");
		conn = connection;
		
		connection.send("MyNameIs", Reg.userName);
		
		//Add disconnect listener
         connection.addDisconnectHandler(handleDisconnect);
		 
		  //Add listener for messages of the type "hello"
        connection.addMessageHandler("RoomFull", function(m:Message){
			 FlxG.switchState(new Panel("error", "Room is currently full."));
			
         });
		 
		 connection.addMessageHandler("RecieveRematch", function(m:Message, id:String){
			if (connection != null)
				connection.disconnect();
			
			FlxG.switchState(new PlayState(client, gameType, id, isLocal));
			
         });
               
         //Add listener for messages of the type "hello"
        connection.addMessageHandler("getID", function(m:Message, userid:UInt){
			Reg.myID = userid;
			
			switch (Reg.myID)
			{
				case 1:
					myPlayer = leftPlayer;
					enemyPlayer = rightPlayer;
				case 2:
					myPlayer = rightPlayer;
					enemyPlayer = leftPlayer;
				default:
					connection.disconnect();
					FlxG.switchState(new MenuState());
			}
			
			tracker.x = leftPlayer.getMidpoint().x;
			tracker.y = leftPlayer.y;
			
         });
		 
		  connection.addMessageHandler("shoot", function(m:Message, userid:UInt){
          
			bow.reset();
			hud.setAimVisible(false);
			
			  
			switch(userid)
			{
				case 1:
					bow.setDirArrow(leftPlayer);
					tracker.x = leftPlayer.getMidpoint().x;
					tracker.y = leftPlayer.y;
					
				case 2:
					bow.setDirArrow(rightPlayer);
					tracker.x = rightPlayer.getMidpoint().x;
					tracker.y = rightPlayer.y;
			}
			  
			if (userid == Reg.myID || isLocal)
			{
				if (userid == Reg.myID)
					bow.unlock(myPlayer);
				else
				{
					bow.unlock(enemyPlayer);
				}
				
				leftPlayer.animation.play("idle");
				rightPlayer.animation.play("idle");
			}
			else
			{
				bow.lock();
				
				if (!isLocal)
					enemyPlayer.animation.play("pull");
				
				if (isSolo)
				{	
					//bot aims
					Timer.delay(aimBot, 1000);	
				}
			}
			
			hud.setTurn(userid);
			hud.header.visible = true;
         });
		 
		 connection.addMessageHandler("UpdateTimer", function(m:Message, time:UInt){
          
			hud.header.text = "Time Left: " + Std.string(time);
         });
		 
		 connection.addMessageHandler("GetChat", function(m:Message, chatMessage:String, userid:UInt){
          
			hud.addMessage(chatMessage, userid);
         });
		 
		  connection.addMessageHandler("receiveShot", function(m:Message, userid:UInt, angle:Float, mag:Float){
          
			if (userid == Reg.myID)
			{
				var myArrow:Arrow = new Arrow(tracker, enemyPlayer, connection, true);
				myArrow.x = myPlayer.getMidpoint().x - myArrow.width / 2;
				myArrow.y = myPlayer.getMidpoint().y -  myArrow.height / 2;
				arrows.add(myArrow);
				var hitBox:ArrowHitbox = new ArrowHitbox(myArrow);
				playerArrows.add(hitBox);
				
				GameUtil.shootArrow(myArrow, angle, mag);	
			}
			
			else if (isSolo)
			{
				var enemyArrow:Arrow = new Arrow(tracker, myPlayer, connection, true);
				enemyArrow.x = enemyPlayer.getMidpoint().x - enemyArrow.width / 2;
				enemyArrow.y = enemyPlayer.getMidpoint().y - enemyArrow.height / 2;
				arrows.add(enemyArrow);
				var hitBox:ArrowHitbox = new ArrowHitbox(enemyArrow);
				enemyArrows.add(hitBox);
				
				GameUtil.shootArrow(enemyArrow, angle, mag);
				
			}
			
			else
			{
				var enemyArrow:Arrow = new Arrow(tracker, myPlayer);
				enemyArrow.x = enemyPlayer.getMidpoint().x - enemyArrow.width / 2;
				enemyArrow.y = enemyPlayer.getMidpoint().y - enemyArrow.height / 2;
				arrows.add(enemyArrow);
				var hitBox:ArrowHitbox = new ArrowHitbox(enemyArrow);
				enemyArrows.add(hitBox);
				
				GameUtil.shootArrow(enemyArrow, angle, mag);
			}
			
			hud.header.visible = false;
			 
         });
		 
		 connection.addMessageHandler("SpaceUsers", function(m:Message, leftOffset:UInt, distance:UInt, p1:String, p2:String){
			leftPlayer.x = leftOffset;
			rightPlayer.x = leftPlayer.x + distance;
			FlxG.worldBounds.x = leftPlayer.x;
			FlxG.worldBounds.width = rightPlayer.x +rightPlayer.width;
			
			tracker.x = leftPlayer.getMidpoint().x; 
			tracker.y = leftPlayer.y;
			
			bow.setRefs(myPlayer, connection);
			hud.setRefs(myPlayer, connection, !(isLocal || isSolo));
			if (isLocal) 
			{
				hud.setNames(p1, "player 2");
			}
			
			else
			{
				hud.setNames(p1, p2);
			}
			
			leftPlayer.visible = true;
			rightPlayer.visible = true;
         });
         
         //Add message listener for users joining the room
         connection.addMessageHandler("UserJoined", function(m:Message, userid:UInt){
            trace("Player with the userid" + userid + "just joined the room");
			
         });
         
         //Add message listener for users leaving the room
         connection.addMessageHandler("UserLeft", function(m:Message, userid:UInt, p1:String, p2:String, playerTurn:UInt){
           isSolo = true; //set to solo play
			trace("Player with the userid" + userid + " just left the room");
			connection.send("SendChat", "Player with the userid " + userid + " just left the room");
			
			hud.setNames(p1, p2);
			
			hud.destroyRematchButton();
			hud.showQuit();
			
			if (playerTurn != Reg.myID)
			{
				connection.send("FinishedShot");
			}
			
			//Sore Losers Encountered achieve
			FlxKongregate.submitStats("Sore Losers Encountered", 1);
			API.unlockMedal("Intimidating");
			FlxGameJolt.addTrophy(28837);
			
         });
         
         //Listen to all messages using a private function
         connection.addMessageHandler("*", handleMessages);
		 
	}
	
	private function handleMessages(m:Message)
	{
        trace("Recived the message" + m);
    }
      
    private function handleDisconnect():Void
	{
        trace("Disconnected from server");
    }
	
	private function handleError(error:PlayerIOError):Void{
         trace("got" + error);
		 
		  FlxG.switchState(new Panel("error", "got " + error));

      }
	
}