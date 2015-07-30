package ;
import flixel.*;
import flixel.util.FlxAngle;

/**
 * ...
 * @author Frank Fazio
 */
class ArrowHitbox extends FlxSprite
{

	private var arrow:Arrow;
	private static inline var radius:Float = 70/2;
	
	public function new(_arrow:Arrow) 
	{
		super();
		arrow = _arrow;
		
		makeGraphic(50, 50);
		visible = false;
	}
	
	override public function update()
	{
		super.update();
		
		x = arrow.getMidpoint().x - width / 2;
		y = arrow.getMidpoint().y - height / 2;
		angle = arrow.angle;
		
		x += (radius - 5) * Math.cos(FlxAngle.asRadians(arrow.angle));
		y += (radius - 5) * Math.sin(FlxAngle.asRadians(arrow.angle));
	}
	
	override public function kill()
	{
		set_active(false);
		set_solid(false);
		
		arrow.kill();
	}
	
}