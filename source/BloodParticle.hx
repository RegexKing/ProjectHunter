package ;
import flixel.effects.particles.FlxParticle;
import flixel.*;

/**
 * ...
 * @author Frank Fazio
 */
class BloodParticle extends FlxParticle
{

	public function new() 
	{
		super();
		
		loadGraphic(AssetPaths.blood__png, true, 6, 6);
		
		animation.add("rnd", [ -1], 1);
		
		animation.play("rnd");
	}
	
	override public function update()
	{
		super.update();
		
		if (y > FlxG.height )
		{
			y = FlxG.height - height;
			active = false;
		}
	}
	
}