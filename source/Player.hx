package  ;
import flixel.*;

/**
 * ...
 * @author Frank Fazio
 */
class Player extends FlxSprite
{

	public static var MAX_HEALTH:Float = 10;
	private var isMan:Bool = true;
	
	public function new(userid:UInt) 
	{
		super(0, 0);
		health = MAX_HEALTH;
		
		if (userid == 1)
		{
			loadGraphic(AssetPaths.archer1__png, true, 150, 150);
		}
		
		else 
		{
			isMan = false;
			
			loadGraphic(AssetPaths.archer2__png, true, 150, 150);
			setFacingFlip(FlxObject.LEFT, true, false);
			setFacingFlip(FlxObject.RIGHT, false, false);
			facing = FlxObject.LEFT;
		}
		
		animation.add("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 6, true);
		animation.add("gesture", [10, 11, 12, 13, 14, 15, 16, 17, 18, 19], 12, false);
		animation.add("win", [20, 21, 22, 23, 24, 25, 26, 27, 28, 29], 12, true);
		animation.add("pull", [30, 31, 32, 33, 34, 35, 36], 12, false);
		animation.add("shoot", [37, 38, 39], 12, false);
		animation.add("lose", [40, 41, 42, 43, 44, 45, 46, 47, 48, 49], 12, false);
		
		y = FlxG.height - height;
		
		setSize(60, 150);
		offset.set(45, 0);
		
		animation.play("idle");
	}
	
	override public function hurt(damage:Float)
	{
		super.hurt(damage);
		
		animation.play("gesture");
		
		var randSound:UInt = Math.ceil(Math.random() * 3);
		
		if (isMan)
		{
			switch (randSound)
			{
				case 1:
					FlxG.sound.play(AssetPaths.maleHurt1__mp3);
				case 2:
					FlxG.sound.play(AssetPaths.maleHurt2__mp3);
				case 3:
					FlxG.sound.play(AssetPaths.maleHurt3__mp3);
			}
		}
		
		else
		{
			switch (randSound)
			{
				case 1:
					FlxG.sound.play(AssetPaths.femHurt1__mp3);
				case 2:
					FlxG.sound.play(AssetPaths.femHurt2__mp3);
				case 3:
					FlxG.sound.play(AssetPaths.femHurt3__mp3);
			}
		}
		
	}
	
	override public function kill()
	{
		super.kill();
		exists = true;
		solid = false;
	}
}