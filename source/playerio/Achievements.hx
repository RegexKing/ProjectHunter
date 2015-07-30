package playerio;

extern class Achievements extends playerio.generated.Achievements {
	var myAchievements(default,never) : Array<Dynamic>;
	var onCompletedHandler(never,default) : Dynamic;
	function new(p1 : playerio.utils.HTTPChannel, p2 : Client) : Void;
	function get(p1 : String) : Achievement;
	function load(p1 : Array<Dynamic>, ?p2 : flash.utils.Function, ?p3 : flash.utils.Function) : Void;
	function progressAdd(p1 : String, p2 : Int, p3 : flash.utils.Function, p4 : flash.utils.Function) : Void;
	function progressComplete(p1 : String, p2 : flash.utils.Function, p3 : flash.utils.Function) : Void;
	function progressMax(p1 : String, p2 : Int, p3 : flash.utils.Function, p4 : flash.utils.Function) : Void;
	function progressSet(p1 : String, p2 : Int, p3 : flash.utils.Function, p4 : flash.utils.Function) : Void;
	function refresh(?p1 : flash.utils.Function, ?p2 : flash.utils.Function) : Void;
}
