package ;
import flixel.FlxG;
import flixel.util.FlxMath;

/**
 * ...
 * @author Frank Fazio
 */
class BotMem
{
	private static var botMemory:BotMem = null;
	
	private static var turnCount = 1;
	private static var range:Float = 800;
	
	public function new() {}
	
	private static inline function getInstance():BotMem
	{
		if (botMemory == null)
		{
			botMemory = new BotMem();
		}
		
		return botMemory;
	}
	
	public static function getMagScaler():Float
	{
		getInstance();
		
		var scaler:Float = 1.0;
		
		var sign:Float = (FlxMath.isEven(Math.ceil(Math.random() * 2.0))) ? 1.0 : -1.0;
		
		scaler = GameUtil.randRange(0, range / turnCount);
		
		scaler *= sign;
		
		turnCount++;
		
		return scaler;
	}
	
	public static function resetCounter()
	{
		getInstance();
		turnCount = 0;
	}
	
}