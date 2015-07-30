package  ;
using flixel.util.FlxSpriteUtil;
import flixel.addons.ui.FlxButtonPlus;
import flixel.addons.ui.FlxInputText;
import flixel.group.FlxSpriteGroup;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.*;
import flixel.text.FlxText;
import flixel.group.FlxGroup;
import flixel.util.FlxPoint;
import playerio.Connection;
import flixel.util.FlxAngle;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author Frank Fazio
 */
class Hud extends FlxGroup
{
	private var player:Player;
	private var connection:Connection;
	private var angleDisp:FlxText;
	private var canvas:FlxSprite;
	private var magDisp:FlxText;
	public var header:FlxText;
	public var chatInput:FlxInputText = null;
	private var chatMessages:FlxGroup;
	private var leftPlayerBar:FlxBar;
	private var rightPlayerBar:FlxBar;
	private var leftPlayer:Player;
	private var rightPlayer:Player;
	private var chatTweens:Array<FlxTween>;
	
	private var quit:FlxButtonPlus;
	private var rematch:FlxButtonPlus;
	
	private var goIcon:FlxSprite;
	private var stopIcon:FlxSprite;
	public var leftName:FlxText;
	public var rightName:FlxText;
	
	private var chatNeeded:Bool = true;
	private var isOffline:Bool;
	
	public function new(_leftPlayer:Player, _rightPlayer:Player, _isOffline:Bool) 
	{
		super();
		isOffline = _isOffline;
		
		chatTweens = new Array<FlxTween>();
		
		leftPlayer = _leftPlayer;
		rightPlayer = _rightPlayer;
		
		header =  new FlxText(0, 16, FlxG.width, "", 18);
		if (!_isOffline) header.text = "Waiting for other player...";
		header.setFormat("Britannic Bold", 24, 0xffFFFFFF, "center", FlxText.BORDER_OUTLINE, FlxColor.BLACK);
		header.x = FlxG.width / 2 - header.width / 2;
		header.scrollFactor.x = header.scrollFactor.y = 0;
		add(header);
		
		quit = new FlxButtonPlus(0, 0, function() {
				rematch.exists = false;
				quit.exists = false;
			
			if (connection != null)
					connection.disconnect();
				
				FlxG.switchState(new MenuState());
			}, 
			"Quit", 109, 32);
		quit.scrollFactor.set(0, 0);
		add(quit);
		quit.x = 0;
		quit.y = 0;
		if (_isOffline) quit.y -= FlxG.height;
		GameUtil.formatButton(quit);
		
		rematch = new FlxButtonPlus(0, 0, function() {
			rematch.exists = false;
			quit.exists = false;
			
			if (connection != null)
				connection.send("Rematch");
			}, 
			"Rematch", 109, 32);
			
		rematch.scrollFactor.set(0, 0);
		add(rematch);
		rematch.x = FlxG.width / 2 - rematch.width / 2;
		rematch.y = header.y + header.height + 32;
		rematch.y -= FlxG.height;
		GameUtil.formatButton(rematch);
		
		leftName =  new FlxText(0, 0, 200, "Player 1", 20);
		leftName.setFormat("Britannic Bold", 20, 0xffFFFFFF, "left", FlxText.BORDER_OUTLINE, FlxColor.BLACK);
		leftName.x = 10;
		leftName.y = FlxG.height - leftName.height;
		leftName.scrollFactor.set(0, 0);
		leftName.visible = false;
		add(leftName);
		
		rightName =  new FlxText(0, 0, 200, "Player 2", 20);
		rightName.setFormat("Britannic Bold", 20, 0xffFFFFFF, "left", FlxText.BORDER_OUTLINE, FlxColor.BLACK);
		rightName.x = FlxG.width - rightName.width - 10;
		rightName.y = FlxG.height - rightName.height;
		rightName.scrollFactor.set(0, 0);
		rightName.visible = false;
		add(rightName);
		
		leftPlayerBar = new FlxBar(10, FlxG.height - leftName.height - 16, FlxBar.FILL_LEFT_TO_RIGHT, 128, 16, _leftPlayer, "health", 0, Player.MAX_HEALTH, true);
		rightPlayerBar = new FlxBar(FlxG.width - 128 - 10, FlxG.height - rightName.height - 16, FlxBar.FILL_RIGHT_TO_LEFT, 128, 16, _rightPlayer, "health", 0, Player.MAX_HEALTH, true);
		leftPlayerBar.scrollFactor.set(0, 0);
		rightPlayerBar.scrollFactor.set(0, 0);
		leftPlayerBar.visible = false;
		rightPlayerBar.visible = false;
		add(leftPlayerBar);
		add(rightPlayerBar);
		
		goIcon = new FlxSprite(0, 0, AssetPaths.go__png);
		stopIcon = new FlxSprite(0, 0, AssetPaths.stop__png);
		goIcon.scrollFactor.set(0, 0);
		stopIcon.scrollFactor.set(0, 0);
		goIcon.y = FlxG.height - goIcon.height;
		stopIcon.y = FlxG.height - stopIcon.height;
		goIcon.visible = false;
		stopIcon.visible = false;
		add(goIcon);
		add(stopIcon);
		
		canvas = new FlxSprite();
		canvas.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);
		canvas.scrollFactor.x = canvas.scrollFactor.y = 0;
		add(canvas);
		
		angleDisp =  new FlxText(0, 0, 0, "", 18, false);
		angleDisp.setFormat("Britannic Bold", 18, 0xffFFFFFF, "left", FlxText.BORDER_OUTLINE, FlxColor.BLACK);
		angleDisp.visible = false;
		angleDisp.scrollFactor.set(0, 0);
		add(angleDisp);
		
		magDisp =  new FlxText(0, 0, 0, "", 18);
		magDisp.setFormat("Britannic Bold", 18, 0xffFFFFFF, "left", FlxText.BORDER_OUTLINE, FlxColor.BLACK);
		magDisp.visible = false;
		magDisp.scrollFactor.set(0, 0);
		add(magDisp);
	}
	
	public function setNames(p1:String, p2:String)
	{
		leftName.text = p1;

		rightName.text = p2;

	}

	
	public function setCanvas(xPos:Float)
	{
		canvas.x = xPos;
	}
	
	public function addMessage(message:String, id:UInt)
	{
		chatMessages.setAll("alpha", 1.0);
		
		for (n in 0...4)
		{
			var i:Int = chatMessages.countLiving() - n - 1;
			
			if (chatTweens[i] != null)
			{
				chatTweens[i].cancel();
				chatTweens[i].destroy();
			}
			
			chatTweens[i] = FlxTween.tween(chatMessages.members[i], { alpha:0 }, 2, { startDelay:n*2 + 3 } );
		}
		
		for (n in 1...4)
		{
			var i:Int = chatMessages.countLiving() - n - 1;
			
			var source:ChatMessage = cast(chatMessages.members[i], ChatMessage);
			var desination:ChatMessage = cast(chatMessages.members[i + 1], ChatMessage);
			
			desination.textColor = source.textColor;
			desination.setFormat(null, 10, desination.textColor);
			
			desination.text = source.text;
		}
		
		
		var newMessage:ChatMessage = cast(chatMessages.members[0], ChatMessage);
		
		switch(id)
		{
			case 1:
				newMessage.textColor = 0xff00FFFF;
				newMessage.setFormat(null, 10, newMessage.textColor);
			case 2:
				newMessage.textColor = 0xffFFFF00;
				newMessage.setFormat(null, 10, newMessage.textColor);
			default:
				newMessage.textColor = 0xffFFFFFF;
				newMessage.setFormat(null, 10, newMessage.textColor);
		}
		
		newMessage.text = message;
	}
	
	public function killHud()
	{
		goIcon.visible = false;
		stopIcon.visible = false;
		
		rematch.y += FlxG.height;
		
		quit.x = 0;
		quit.y = 0;
	}
	
	public function destroyRematchButton()
	{
		rematch.x = -(FlxG.width * 2);
		rematch.kill();
	}
	
	public function showQuit()
	{
		quit.x = 0;
		quit.y = 0;
	}
	
	override public function update()
	{
		super.update();
		
		if (chatInput != null && chatNeeded)
		{
			if (FlxG.keys.anyJustReleased(["ENTER"]) && chatInput.visible)
			{
				if (chatInput.text != "")
				{
					connection.send("SendChat", chatInput.text);
					chatInput.text = "";
					chatInput.caretIndex = 0;
				}
				
				chatInput.hasFocus = false;
				chatInput.visible = false;
			}
			
			else if (FlxG.keys.anyJustReleased(["ENTER"]) && !chatInput.visible)
			{
				chatInput.hasFocus = true;
				chatInput.visible = true;
			}
		
			if (FlxG.keys.anyJustReleased(["ESCAPE"]) && chatInput.visible)
			{
				chatInput.hasFocus = false;
				chatInput.visible = false;
			}
		}
	
	}
	
	public function setTurn(id:UInt)
	{
		switch (id)
		{
			case 1:
				leftName.setFormat("Britannic Bold", 20, 0xff00FFFF, "left", FlxText.BORDER_OUTLINE, FlxColor.BLACK);
				rightName.setFormat("Britannic Bold", 20, 0xffFFFFFF, "right", FlxText.BORDER_OUTLINE, FlxColor.BLACK);
				goIcon.x = 0;
				stopIcon.x = FlxG.width - stopIcon.width;
				
			case 2:
				leftName.setFormat("Britannic Bold", 20, 0xffFFFFFF, "left", FlxText.BORDER_OUTLINE, FlxColor.BLACK);
				rightName.setFormat("Britannic Bold", 20,  0xffFFFF00, "right", FlxText.BORDER_OUTLINE, FlxColor.BLACK);
				goIcon.x = FlxG.width - goIcon.width;
				stopIcon.x = 0;
		}
	}
	
	public function setRefs(_player:Player, _connection:Connection, _chatNeeded:Bool)
	{
		player = _player;
		connection = _connection;
		chatNeeded = _chatNeeded;
		
		if (!isOffline) quit.y -= FlxG.height;
		else quit.y += FlxG.height;
		
		leftName.visible = true;
		rightName.visible = true;
		leftPlayerBar.visible = true;
		rightPlayerBar.visible = true;
		goIcon.visible = true;
		stopIcon.visible = true;
		leftName.x = leftPlayerBar.x = goIcon.width + 5;
		rightName.x = FlxG.width - rightName.width - goIcon.width - 5;
		rightPlayerBar.x = FlxG.width - rightPlayerBar.width - goIcon.width - 5;
		goIcon.y -= 5;
		stopIcon.y -= 5;
		
		chatInput = new FlxInputText(0, 0, 350, "", 10, FlxColor.WHITE, FlxColor.CHARCOAL);
		chatInput.maxLength = 50;
		chatInput.borderColor = FlxColor.TRANSPARENT;
		chatInput.x = FlxG.width / 2 - chatInput.width / 2;
		chatInput.y = FlxG.height - chatInput.height - 10;
		chatInput.scrollFactor.x = chatInput.scrollFactor.y = 0;
		chatInput.visible = false;
		if (_chatNeeded)
			add(chatInput);
		
		chatMessages = new FlxGroup();
		add(chatMessages);
		for (i in 0...4)
		{
			var chatMessage:ChatMessage = new ChatMessage(chatInput.x, chatInput.y - i*chatInput.height - chatInput.height, 350, "", 10);
			chatMessage.setFormat(null, 10, FlxColor.BLACK);
			chatMessage.wordWrap = false;
			chatMessage.autoSize = false;
			chatMessage.alpha = 0.5;
			chatMessage.scrollFactor.x = chatMessage.scrollFactor.y = 0;
			chatMessages.add(chatMessage);
			
		}
	}
	
	public function setAim(angle:Float, mag:Float, startPoint:FlxPoint)
	{
		angleDisp.text = Std.string(GameUtil.fixedFloat(FlxAngle.asDegrees(angle))) + "\u00B0";
		magDisp.text = Std.string(GameUtil.fixedFloat(mag * 0.224808943)) + " lbs";
		
		canvas.fill(FlxColor.TRANSPARENT);
		
		var pullX:Float = startPoint.x + mag * -(Math.cos(angle));
		var pullY:Float = startPoint.y + mag * -(Math.sin(angle));
		
		canvas.drawLine(startPoint.x, startPoint.y, pullX, pullY, { thickness: 1, color: FlxColor.WHITE } );
		
		magDisp.x = pullX + magDisp.width;
		magDisp.y = pullY;
		
	}
	
	public function setAnglePos(xPos:Float, yPos:Float)
	{
		angleDisp.x = xPos;
		angleDisp.y = yPos;
	}
	
	public function setAimVisible(state:Bool)
	{
		angleDisp.visible = state;
		magDisp.visible = state;
		
		canvas.fill(FlxColor.TRANSPARENT);
	}
	
}