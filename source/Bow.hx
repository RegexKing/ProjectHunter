package  ;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxMath;
import flixel.util.FlxAngle;
import flixel.FlxCamera;
import flixel.util.FlxPoint;
import playerio.Connection;

/**
 * ...
 * @author Frank Fazio
 */
class Bow extends FlxGroup
{
	private static var kSpring:Float = 8;
	
	private var justPressed:Bool = true;
	
	private var player:Player;
	private var arrows:FlxGroup;
	private var equippedArrow:Arrow;
	private var locked:Bool = true;
	private var hud:Hud;
	private var angle:Float = 0;
	private var mag:Float = 0;
	
	private var startPoint:FlxPoint;
	private var endPoint:FlxPoint;
	private var connection:Connection;
	public var arrow:FlxSprite;
	
	public function new(_hud:Hud)
	{
		super();
		hud = _hud;
		
		startPoint = FlxPoint.get();
		endPoint = FlxPoint.get();
		
		arrow = new FlxSprite(0, 0, AssetPaths.dirArrow__png);
		arrow.visible = false;
	}
	
	public function setRefs(_player:Player, _connection:Connection)
	{
		player = _player;
		connection = _connection;
		
		arrow.x = player.getMidpoint().x - arrow.width / 2;
		arrow.y = player.getMidpoint().y - arrow.height / 2 - 20;
	}
	
	public function setDirArrow(_player:Player)
	{
		arrow.x = _player.getMidpoint().x - arrow.width / 2 - 20;
	}
	
	public function unlock(_player:Player = null)
	{
		if (_player != null)
		{
			player = _player;
		}
		
		locked = false;
	}
	
	public function lock()
	{
		locked = true;
	}
	
	public function reset()
	{
		justPressed = true;
	}
	
	override public function update()
	{
		super.update();
		
		if (!locked)
		{
			if (FlxG.mouse.pressed)
			{	
				if (justPressed)
				{	
					justPressed = false;
					
					startPoint.copyFrom(FlxG.mouse.getScreenPosition());
					hud.setAnglePos(startPoint.x, startPoint.y);
					
					hud.setAimVisible(true);
					
					arrow.visible = true;
					
					player.animation.play("pull");
				}
					
				var screenPosX:Float = FlxG.mouse.getScreenPosition().x;
				var screenPosY:Float = FlxG.mouse.getScreenPosition().y;
				
				var distX:Float = startPoint.x - screenPosX;
				var distY:Float = startPoint.y - screenPosY;
				
				angle = GameUtil.fixedFloat(Math.atan2(distY, distX), 4);
				
				mag = GameUtil.fixedFloat(Math.sqrt(distX * distX + distY * distY), 4);
				
				if (mag * 0.224808943 > 100.0)
				{
					mag = 100.0 / 0.224808943;
				}
				
				
				hud.setAim(angle, mag, startPoint);
	
				arrow.angle = (FlxAngle.asDegrees(angle));
		
			}
			
			if (FlxG.mouse.justReleased)
			{	
				locked = true;
				justPressed = true;
				
				connection.send("ShotMade", angle, mag * kSpring);
				
				hud.setAimVisible(false);
				
				arrow.visible = false;
				
				player.animation.play("shoot");
			}
		}
	}
	
	override public function destroy()
	{
		super.destroy();
		startPoint.put();
		endPoint.put();
	}
	
}