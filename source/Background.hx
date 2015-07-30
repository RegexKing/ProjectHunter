package ;
import flixel.*;
import flixel.group.FlxGroup;
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxColor;
/**
 * ...
 * @author Frank Fazio
 */
class Background extends FlxGroup
{
	
	public var midPlus:FlxBackdrop;
	private var tempTracker:FlxObject;

	public function new() 
	{
		super();
		
		tempTracker = new FlxObject();
		tempTracker.x = FlxG.width;
		tempTracker.y = FlxG.height - 150;
		add(tempTracker);
		FlxG.camera.follow(tempTracker);
		
		var gradient:FlxSprite = new FlxSprite();
		gradient.loadGraphic(AssetPaths.gradient__png);
		gradient.scrollFactor.set(0, 0.1);
		gradient.y = -320;
		var mtn:FlxSprite = new FlxSprite();
		mtn.loadGraphic(AssetPaths.mtn__png);
		mtn.scrollFactor.set(0, 0.1);
		mtn.x = -300;
		mtn.y = 50;
		var sky:FlxBackdrop = new FlxBackdrop(AssetPaths.sky__png, 0.15, 0.15, true, false);
		sky.x = -900;
		var bg1:FlxBackdrop = new FlxBackdrop(AssetPaths.bg_1__png, 0.4, 0.4, true, false);
		bg1.x = -150;
		bg1.y = -185;
		var bg2:FlxBackdrop = new FlxBackdrop(AssetPaths.bg_2__png, 0.6, 0.6, true, false);
		bg2.x = -150;
		bg2.y = -20;
		var middleGround:FlxBackdrop = new FlxBackdrop(AssetPaths.middleground__png, 1, 1, true, false);
		middleGround.y = -250;
		middleGround.x = -150;
		
		midPlus = new FlxBackdrop(AssetPaths.middleplus__png, 1, 1, true, false);
		midPlus.x = -150;
		midPlus.y = -330;
		
		var bgFill:FlxSprite = new FlxSprite(0, 0);
		bgFill.makeGraphic(FlxG.width, FlxG.height, 0xff090F02);
		bgFill.scrollFactor.set(0, 0.15);
		bgFill.y = 225;
		
		var bgFill2:FlxSprite = new FlxSprite(0, 0);
		bgFill2.makeGraphic(FlxG.width, 100, 0xff4D5C22);
		bgFill2.scrollFactor.set(0, 0.15);
		bgFill2.y = 225;
		
		var fgFill:FlxSprite = new FlxSprite(0, 0);
		fgFill.makeGraphic(FlxG.width, FlxG.height, 0xff4D5C22);
		fgFill.scrollFactor.set(0, 1);
		fgFill.y = 395;
		
		var fgFill2:FlxSprite = new FlxSprite(0, 0);
		fgFill2.makeGraphic(FlxG.width, FlxG.height, 0xff4D5C22);
		fgFill2.scrollFactor.set(0, 0.4);
		fgFill2.y = 350;
		
		add(gradient);
		add(bgFill);
		add(bgFill2);
		add(mtn);
		add(sky);
		add(fgFill2);
		add(bg1);
		add(bg2);
		add(fgFill);
		add(middleGround);
	}
	
	public function scroll(vX:Float)
	{
		tempTracker.velocity.x = vX;
	}
	
	public function setXPos(xPos:Float)
	{
		tempTracker.x += xPos;
	}
	
}