package ;

import flixel.addons.ui.FlxButtonPlus;
import flixel.util.FlxPoint;
import flixel.*;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author Frank Fazio
 */
 
class GameUtil
{

	public function new() 
	{
		
	}
	
	public static inline var GRAVITY:Float = 2000;
	
	public static function randString():String
	{
		var result:String = "";
		
		for (i in 0...12)
		{
			result += String.fromCharCode(Math.floor(Math.random() * (126 - 33 + 1) + 33));
		}
		
		return result;
	}
	
	public static function calcAim(dx:Float, dy:Float, t:Float = 1):FlxPoint
	{
		var vx:Float = dx / t;
		var vy:Float = (dy - (GRAVITY / 2) * t * t) / t;
		
		var angle:Float = Math.atan2(vy, vx);
		var mag:Float = Math.sqrt(vx * vx + vy * vy);
		
		return FlxPoint.get(angle, mag);
	}
	
	public static function shootArrow(arrow:Arrow, angle:Float, mag:Float)
	{
		arrow.velocity.x = mag * Math.cos(angle);
		arrow.velocity.y =  mag * Math.sin(angle);
		arrow.enableGrav();
		
		var max:Float = 3560;
		var randSound:UInt = Math.ceil(Math.random() * 2);
		
		if (mag <= max * 0.25)
		{
			switch(randSound)
			{
				case 1:
					FlxG.sound.play(AssetPaths.arrowHit1__mp3);
				case 2:
					FlxG.sound.play(AssetPaths.arrowHit2__mp3);
			}
		}
		
		else if (mag <= max * 0.5)
		{
			switch(randSound)
			{
				case 1:
					FlxG.sound.play(AssetPaths.arrowHit3__mp3);
				case 2:
					FlxG.sound.play(AssetPaths.arrowHit4__mp3);
			}
		}
		
		else if (mag <= max * 0.75)
		{
			switch(randSound)
			{
				case 1:
					FlxG.sound.play(AssetPaths.arrowHit5__mp3);
				case 2:
					FlxG.sound.play(AssetPaths.arrowHit6__mp3);
			}
		}
		
		else
		{
			switch(randSound)
			{
				case 1:
					FlxG.sound.play(AssetPaths.arrowHit7__mp3);
				case 2:
					FlxG.sound.play(AssetPaths.arrowHit8__mp3);
			}
		}
		
	}
	
	public static inline function fixedFloat(v:Float, precision:Int = 2):Float
	{
		return Math.round( v * Math.pow(10, precision) ) / Math.pow(10, precision);
	}
	
	public static inline function randRange(minNum:Float, maxNum:Float):Float
	{
		return Math.floor(Math.random() * (maxNum - minNum + 1.0)) + minNum;
	}
	
	public static function formatButton(button:FlxButtonPlus)
	{
		button.loadButtonGraphic(new FlxSprite(0, 0, AssetPaths.button__png), new FlxSprite(0, 0, AssetPaths.highlight__png));
		button.textNormal.setFormat("Britannic Bold", 14, 0xffFFFFFF, "center", FlxText.BORDER_OUTLINE, FlxColor.BROWN);
		button.textHighlight.setFormat("Britannic Bold", 14, 0xffFFFFFF, "center", FlxText.BORDER_OUTLINE, FlxColor.BROWN);
	}
	
}