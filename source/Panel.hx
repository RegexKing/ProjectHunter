package ;
import flixel.*;
import flixel.addons.ui.FlxInputText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import haxe.io.Error;
import flixel.addons.ui.FlxButtonPlus;
import playerio.*;

/**
 * ...
 * @author Frank Fazio
 */
class Panel extends FlxState
{
	private var type:String;
	private var errMessage:String = null;
	private var button:FlxButtonPlus;
	private var nameInput:FlxInputText = null;
	private var cancel:FlxButtonPlus;
	
	private var roomType:String;
	private var roomID:String;
	private var conn:Connection = null;
	private var ranked:Bool = false;
	
	public function new(_type:String, _errMessage:String=null) 
	{
		super();
		
		type = _type;
		errMessage = _errMessage;
	}
	
	override public function create()
	{
		super.create();
		
		var bg:Background = new Background();
		bg.setXPos(Math.ceil(Math.random() * 4000));
		bg.scroll(200);
		add(bg);
		
		var underLay:FlxSprite = new FlxSprite();
		underLay.makeGraphic(530, 225, FlxColor.CHARCOAL);
		underLay.alpha = 0.7;
		underLay.x = 133;
		underLay.y = 50;
		underLay.scrollFactor.set(0, 0);
		add(underLay);
		
		var message:FlxText = new FlxText(underLay.x + 10, underLay.y + 10, underLay.width - 20, "", 14);
		message.setFormat("Britannic Bold", 20, FlxColor.WHITE, "left", FlxText.BORDER_SHADOW, FlxColor.BLACK);
		message.scrollFactor.set(0, 0);
		add(message);
		
		nameInput = new FlxInputText(0, 0, 200, "", 10, FlxColor.WHITE, FlxColor.CHARCOAL);
		nameInput.maxLength = 20;
		nameInput.x = underLay.x + underLay.width/2 - nameInput.width / 2;
		nameInput.y = underLay.y + underLay.height + nameInput.height + 32;
		nameInput.scrollFactor.set(0, 0);
		add(nameInput);
		nameInput.exists = false;
		
		cancel = new FlxButtonPlus(nameInput.x + nameInput.width / 2, nameInput.y + nameInput.height + 32, backToMenu, "Return", 109, 32);
		cancel.scrollFactor.set(0, 0);
		GameUtil.formatButton(cancel);
		
		button = new FlxButtonPlus(cancel.x, cancel.y, null, "Accept", 109, 32);
		button.scrollFactor.set(0, 0);
		GameUtil.formatButton(button);
		
		var spaceSlice:Float = (underLay.width - cancel.width * 2) / 3;
		
		cancel.x = underLay.x + spaceSlice;
		button.x = underLay.x + button.width + spaceSlice * 2;
		
		add(cancel);
		add(button);
		
		switch(type)
		{
			case "error":
				message.text = errMessage;
				button.exists = false;
			case "roomFull":
				message.text = errMessage;
				cancel.exists = false;
				message.text = "Room is currently full.";
				message.setFormat("Britannic Bold", 20, FlxColor.WHITE, "center", FlxText.BORDER_SHADOW, FlxColor.BLACK);
				button.onClickCallback = changeRoom;
			case "changeName":
				nameInput.text = Reg.userName;
				message.text = "Change your name";
				message.setFormat("Britannic Bold", 24, FlxColor.WHITE, "center", FlxText.BORDER_SHADOW, FlxColor.BLACK);
				nameInput.exists = true;
				button.onClickCallback = changeName;
			case "credits":
				button.exists = false;
				message.setFormat("Britannic Bold", 20, FlxColor.WHITE, "center", FlxText.BORDER_SHADOW, FlxColor.BLACK);
				message.text = "Programmer: Snakebee" +
					"\n\nBackground Art: Tiny Speck"
					+ "\n\nCharacter Sprites: Calciumtrice"
					+ "\n\nAdditional Art: Nallebeorn"
					+ "\n\nAdditional Sound Effects: qubodup";
			case "tutorial":
				button.exists = false;
				message.setFormat("Britannic Bold", 16, FlxColor.WHITE, "center", FlxText.BORDER_SHADOW, FlxColor.BLACK);
				message.text = "Mouse: Click and drag the mouse to aim your bow."
				+ "\n\tStarting Point: Angle (degrees)"
				+ "\n\tEnding Point: Power"
				+ "\n\nRelease the mouse button to shoot"
				+ "\n\n+ / - : Adjust Volume"
				+ "\n\nOnline:"
				+ "\nEnter: Open chat / Send chat message"
				+ "\nEscape: Manually close chat";
			case "findRoom":
				message.text = "Enter a room name to create or join an online session";
				message.setFormat("Britannic Bold", 20, FlxColor.WHITE, "center", FlxText.BORDER_SHADOW, FlxColor.BLACK);
				nameInput.exists = true;
				button.onClickCallback = findRoom;
			case "findMatch":
				ranked = true;
				message.text = "Searching for opponent...";
				message.setFormat("Britannic Bold", 24, FlxColor.WHITE, "center", FlxText.BORDER_SHADOW, FlxColor.BLACK);
				button.exists = false;
				connectToClient("quick");
			default:
				trace("non-valid panal type was passed in the constructor");
		}
	}
	
	public function connectToClient(connectType:String)
	{	
		switch (connectType)
		{
			case "room":
				PlayerIO.connect(
				flash.Lib.current.stage,                        //Referance to stage
				"cacciatora-online-eymvitnki1no98esrs3a",         //Game id (Get your own at playerio.com)
				"public",                     //Connection id, default is public
				Reg.userName,                  //Username
				"",                           //User auth. Can be left blank if authentication is disabled on connection
				null,                        //Current PartnerPay partner.
				handleRoomConnect,                  //Function executed on successful connect
				handleError                   //Function executed if we recive an error
				);   
		 
			case "quick":
				PlayerIO.connect(
				flash.Lib.current.stage,                        //Referance to stage
				"cacciatora-online-eymvitnki1no98esrs3a",         //Game id (Get your own at playerio.com)
				"public",                     //Connection id, default is public
				Reg.userName,                  //Username
				"",                           //User auth. Can be left blank if authentication is disabled on connection
				null,                        //Current PartnerPay partner.
				handleConnection,                  //Function executed on successful connect
				handleError                   //Function executed if we recive an error
				);   
				
		}
	}
	
	private function handleConnection(client:Client)
	{
		 trace("Sucessfully connected to player.io");
         
         //Set developmentsever (Comment out to connect to your server online)
          if (Reg.isDebug) client.multiplayer.developmentServer = "localhost:8184";
         
         //Create pr join the room test
         client.multiplayer.createJoinRoom(
            "eHarmony",                        //Room id. If set to null a random roomid is used
            "QUICK",                     //The game type started on the server
            true,                        //Should the room be visible in the lobby?
            {},                           //Room data. This data is returned to lobby list. Variabels can be modifed on the server
            {},                           //User join data
            handleJoin,                     //Function executed on successful joining of the room
            handleError                     //Function executed if we got a join error
         );
	}
	
	
	private function handleJoin(connection:Connection)
	{
		conn = connection;
		//Listen to all messages using a private function
         connection.addMessageHandler("*", function handleMessages(m:Message) {
        trace("Recived the message" + m);
		});
		
		connection.addMessageHandler("FoundMatch", function handleMessages(m:Message, _roomID:String) {
			connection.disconnect();
			roomType = "PVP";
			roomID = _roomID;
			
			connectToClient("room");
		});
	}
      
	
      private function handleRoomConnect(client:Client):Void {
		  
        FlxG.switchState(new PlayState(client, roomType, roomID, false, ranked));
      }

      private function handleError(error:PlayerIOError):Void{
         trace("got" + error);
		 
		 FlxG.switchState(new Panel("error", "got " + error));

      }
	  
	  public function findRoom()
	  {
		  if (nameInput.text != "")
		  {
			  killButtons();
			  
			  roomType = "PVP";
			  roomID = nameInput.text.toUpperCase();
			  connectToClient("room");
		  }
	  }
	
	override public function update()
	{
		super.update();
		
		if (nameInput != null)
		{
			nameInput.hasFocus = true;
		}
	}
	
	public function changeRoom()
	{
		killButtons();
		FlxG.switchState(new Panel("findRoom"));
	}
	
	public function changeName()
	{
		killButtons();
		
		Reg.userName = nameInput.text;
		backToMenu();
	}
	
	public function backToMenu()
	{
		killButtons();
		
		if (conn != null) conn.disconnect();
		FlxG.switchState(new MenuState());
	}
	
	private function killButtons()
	{
		button.exists = false;
		cancel.exists = false;
	}
	
}