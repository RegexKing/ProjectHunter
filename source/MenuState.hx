package;

import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxButtonPlus;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import playerio.*;
import playerio.PlayerIO;
import flixel.util.FlxColor;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	private var roomButton:FlxButtonPlus;
	private var quickMatchButton:FlxButtonPlus;
	private var botButton:FlxButtonPlus;
	private var nameButton:FlxButtonPlus;
	private var tutButton:FlxButtonPlus;
	private var credits:FlxButtonPlus;
	private var local:FlxButtonPlus;
	private var wantLocal:Bool = false;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		var bg:Background = new Background();
		bg.setXPos(Math.ceil(Math.random() * 4000));
		bg.scroll(200);
		
		var title:FlxSprite = new FlxSprite(0, 0, AssetPaths.title__png);
		title.scrollFactor.set(0, 0);
		title.x = FlxG.width / 2 - title.width / 2;
		title.y = 32;
		
		quickMatchButton = new FlxButtonPlus(0, 0, connectToQuickMatch, "Ranked Match", 109, 32);
		quickMatchButton.x = FlxG.width / 2 - (quickMatchButton.width * 2 + 32) / 2;
		quickMatchButton.y = FlxG.height / 2 - 32;
		quickMatchButton.scrollFactor.set(0, 0);
		GameUtil.formatButton(quickMatchButton);
		
		roomButton = new FlxButtonPlus(quickMatchButton.x + quickMatchButton.width + 32, quickMatchButton.y, connectToRoom, "Join Room", 109, 32);
		roomButton.scrollFactor.set(0, 0);
		GameUtil.formatButton(roomButton);
		
		local = new FlxButtonPlus(quickMatchButton.x, roomButton.y + roomButton.height + 32, goLocal, "Local Play", 109, 32);
		local.scrollFactor.set(0, 0);
		GameUtil.formatButton(local);
		
		botButton = new FlxButtonPlus(quickMatchButton.x + quickMatchButton.width + 32, roomButton.y + roomButton.height + 32, connectToClient, "Solo Play", 109, 32);
		botButton.scrollFactor.set(0, 0);
		GameUtil.formatButton(botButton);
		
		tutButton = new FlxButtonPlus(quickMatchButton.x, botButton.y + botButton.height + 32, goToTut, "Controls", 109, 32);
		tutButton.scrollFactor.set(0, 0);
		GameUtil.formatButton(tutButton);
		
		nameButton = new FlxButtonPlus(quickMatchButton.x + quickMatchButton.width + 32, botButton.y + botButton.height + 32, changeName, "Change Name", 109, 32);
		nameButton.scrollFactor.set(0, 0);
		GameUtil.formatButton(nameButton);
	
		credits = new FlxButtonPlus(quickMatchButton.x + (quickMatchButton.width*2 + 32) / 2 - tutButton.width / 2, tutButton.y + tutButton.height + 32, goToCredits, "Credits", 109, 32);
		credits.scrollFactor.set(0, 0);
		GameUtil.formatButton(credits);
		
		add(bg);
		add(title);
		add(roomButton);
		add(quickMatchButton);
		add(local);
		add(botButton);
		add(nameButton);
		add(tutButton);
		add(credits);
	}
	
	public function goLocal()
	{
		removeButtons();
		wantLocal = true;
		connectToClient();
	}
	
	public function goToCredits()
	{
		removeButtons();
		FlxG.switchState(new Panel("credits"));
	}
	
	public function goToTut()
	{
		removeButtons();
		FlxG.switchState(new Panel("tutorial"));
	}
	
	public function changeName()
	{
		removeButtons();
		FlxG.switchState(new Panel("changeName"));
	}
	
	
	public function connectToQuickMatch()
	{
		removeButtons();
		FlxG.switchState(new Panel("findMatch"));
	}
	
	public function connectToRoom()
	{
		removeButtons();
		FlxG.switchState(new Panel("findRoom"));
	}
	
	private function removeButtons()
	{
		roomButton.kill();
		quickMatchButton.kill();
		botButton.kill();
		nameButton.kill();
		tutButton.kill();
		credits.kill();
		local.kill();
	}
	
	public function connectToClient()
	{
		removeButtons();
		PlayerIO.connect(
            flash.Lib.current.stage,                        //Referance to stage
            "cacciatora-online-eymvitnki1no98esrs3a",         //Game id (Get your own at playerio.com)
            "public",                     //Connection id, default is public
            Reg.userName,                  //Username
            "",                           //User auth. Can be left blank if authentication is disabled on connection
            null,                        //Current PartnerPay partner.
            handleConnect,                  //Function executed on successful connect
            handleError                   //Function executed if we recive an error
         );   
	}
      
      private function handleConnect(client:Client):Void {
		  	// flash.Lib.current.stage.removeChildAt(0);
        FlxG.switchState(new PlayState(client, "BOTPLAY", GameUtil.randString(), wantLocal));
      }

      private function handleError(error:PlayerIOError):Void{
         trace("got" + error);
		 
		 FlxG.switchState(new Panel("error", "got " + error));

      }
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}
