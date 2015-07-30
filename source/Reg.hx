package;

import com.newgrounds.assets.DefaultMedalIcon;
import flixel.util.FlxSave;
import com.newgrounds.API;
import flixel.addons.api.FlxGameJolt;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	public static inline var isDebug:Bool = false;
	
	/**
	 * Generic levels Array that can be used for cross-state stuff.
	 * Example usage: Storing the levels of a platformer.
	 */
	public static var levels:Array<Dynamic> = [];
	/**
	 * Generic level variable that can be used for cross-state stuff.
	 * Example usage: Storing the current level number.
	 */
	public static var level:Int = 0;
	/**
	 * Generic scores Array that can be used for cross-state stuff.
	 * Example usage: Storing the scores for level.
	 */
	public static var scores:Array<Dynamic> = [];
	/**
	 * Generic score variable that can be used for cross-state stuff.
	 * Example usage: Storing the current score.
	 */
	public static var score:Int = 0;
	/**
	 * Generic bucket for storing different FlxSaves.
	 * Especially useful for setting up multiple save slots.
	 */
	public static var saveRecord:FlxSave = new FlxSave();
	
	public static var myID:UInt = 0;
	
	public static var userName:String = "user" + Std.string(Math.ceil(Math.random() * 999));
	
	public static function writeSave(type:String)
	{
		switch (type)
		{
			case "Headshots":
				if (saveRecord.data.headshots == null) saveRecord.data.headshots = 1;
				else saveRecord.data.headshots++;
				
				var headshots:Float = cast(saveRecord.data.headshots, Float);
				
				if (headshots >= 10)
				{
					API.unlockMedal("Pow, Right In the Kisser!");
					FlxGameJolt.addTrophy(28833);
				}
				if (headshots >= 50)
				{
					API.unlockMedal("Ace Bowman");
					FlxGameJolt.addTrophy(28835);
				}
			case "Hits":
				if (saveRecord.data.hits == null) saveRecord.data.hits = 1;
				else saveRecord.data.hits++;
				
				var hits:Float = cast(saveRecord.data.hits, Float);
				
				API.postScore("Arrows Hits", hits);
				FlxGameJolt.addScore("Arrows Hits", hits);
				
				if (hits >= 300)
				{
					API.unlockMedal("300");
					FlxGameJolt.addTrophy(28834);
				}
					
				
			case "Ranked Match Wins":
				if (saveRecord.data.ranked_match_wins == null) saveRecord.data.ranked_match_wins = 1;
				else saveRecord.data.ranked_match_wins++;
				
				var wins:Float = cast(saveRecord.data.ranked_match_wins, Float);
				
				API.postScore("Ranked Match Wins", wins);
				FlxGameJolt.addScore("Ranked Match Wins", wins);
				
				if (wins >= 3) 
				{
					API.unlockMedal("Just Getting Started");
					FlxGameJolt.addTrophy(28830);
				}
				if (wins >= 10) 
				{
					API.unlockMedal("Can't Touch This");
					FlxGameJolt.addTrophy(28831);
				}
				if (wins >= 25) 
				{
					API.unlockMedal("Veteran");
					FlxGameJolt.addTrophy(28832);
				}
				
				
			default:
				trace("save data not found");
		}
		
		saveRecord.flush();
	}
}