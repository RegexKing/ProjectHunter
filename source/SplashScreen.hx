package ;
import flixel.*;
import flixel.text.FlxText;
import flixel.addons.api.FlxKongregate;
import flixel.addons.api.FlxGameJolt;
import flixel.util.FlxColor;
import com.newgrounds.API;
import flash.display.Loader;
import flixel.util.FlxSave;
import haxe.Timer;
import flixel.addons.effects.FlxGlitchSprite;

/**
 * ...
 * @author Frank Fazio
 */
class SplashScreen extends FlxState
{

	public function new() 
	{	
		super();
	}
	
	override public function create()
	{
		super.create();
		
		API.connect(flash.Lib.current, "40920:Y9lgzhLK", "KLgs20PUKfGFS2Guq1oUb5rrrUWI6xmV");
		FlxKongregate.init(connectKongregate);
		FlxGameJolt.init(69777, "3577a93ad282e41f69b13a16cdf289cb");
		FlxGameJolt.authUser();
		
		FlxG.autoPause = false;
		FlxG.mouse.useSystemCursor = true;
		
		var bg:FlxSprite = new FlxSprite();
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.LAVENDER);
		add(bg);
		
		var logo:FlxSprite = new FlxSprite(0, 0, AssetPaths.chiffon_logo__png);
		logo.x = FlxG.width / 2 - logo.width / 2;
		logo.y = FlxG.height * 0.2 - 32;
		
		var glitch:FlxGlitchSprite = new FlxGlitchSprite(logo, 2, 4, 0.03);
		add(glitch);
		
		var name:FlxText = new FlxText();
		name.setFormat("ChiffonBows", 52, FlxColor.WHITE, "left", FlxText.BORDER_NONE, FlxColor.BLACK);
		name.text = "Chiffon Software";
		name.x = logo.x + name.width / 2 - 32;
		name.y = logo.y + logo.height + 32;
		add(name);
		
		
		FlxG.camera.fade(FlxColor.BLACK, 1, true, delay);
	}
	
	private function delay()
	{
		Timer.delay(fadeCamOut, 2000);
	}
	
	private function fadeCamOut()
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, false, startGame);
	}
	
	private function startGame()
	{
		if (API.username != null)
		{
			Reg.userName = API.username;
		}
		
		else if (FlxKongregate.getUserName() != "Guest")
		{
			Reg.userName = FlxKongregate.getUserName();
		}
		
		else if (FlxGameJolt.username != "No user")
		{
			Reg.userName = FlxGameJolt.username;
		}
		
		FlxG.sound.playMusic(AssetPaths.woodland_loop__mp3, 1, true);
		
		FlxG.switchState(new MenuState());
	}
	
	private function connectKongregate()
	{
		FlxKongregate.connect();
	}
	
}