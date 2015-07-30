package  ;
import flixel.*;
import flixel.util.FlxMath;
import flixel.util.FlxAngle;
import flixel.tweens.*;
import playerio.Connection;


/**
 * ...
 * @author Frank Fazio
 */
class Arrow extends FlxSprite
{
	
	private var player:FlxSprite;
	private var tracker:FlxObject = null;
	private var trackFinish:Bool = false;
	private var connection:Connection = null;
	private var hasGrav:Bool = false;
	public var hasHit:Bool = true;
	
	public function new(_tracker:FlxObject = null, _player:Player = null, _connection:Connection=null, _trackFinish:Bool = false) 
	{
		super();
		
		tracker = _tracker;
		player = _player;
		trackFinish  = _trackFinish;
		connection = _connection;
		
		loadGraphic(AssetPaths.arrow__png, true, 70, 14);
		animation.add("whole", [0], 1, false);
		animation.add("broken", [1], 1, false);
		animation.play("whole");
	}
	
	public function enableGrav()
	{
		hasGrav = true;
	}
	
	override public function update()
	{
		super.update();
		
		if (hasGrav) 
		{
			acceleration.y = GameUtil.GRAVITY; // gravity
			set_angle(FlxAngle.asDegrees(Math.atan2(velocity.y, velocity.x)));
		}
		
		hitFloor();
		
		if (tracker != null)
		{
			tracker.x = getMidpoint().x;
			tracker.y = getMidpoint().y;
		}
	}
	
	private function hitFloor()
	{
		if (y > FlxG.height )
		{
			hasHit = false;
			
			y = FlxG.height - height;
			
			kill();
			
			FlxG.sound.play(AssetPaths.arrowgrnd__mp3);
		}
	}
	
	override public function kill()
	{
		set_active(false);
		set_solid(false);
		
		animation.play("broken");
		
		tweenArrow();
	}
	
	private function tweenArrow()
	{
		if (trackFinish)
			FlxTween.tween(tracker, { x:player.getMidpoint().x, y:player.y }, 1, { startDelay:1, complete:finished } );
		else
			FlxTween.tween(tracker, { x:player.getMidpoint().x, y:player.y }, 1, { startDelay:1 } );	
	}
	
	private function finished(tween:FlxTween):Void
	{
		connection.send("FinishedShot");
	}
}