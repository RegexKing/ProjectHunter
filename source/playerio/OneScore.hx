package playerio;

extern class OneScore extends playerio.generated.OneScore {
	var percentile(default,never) : Float;
	var score(default,never) : Int;
	var topRank(default,never) : Int;
	function new(p1 : playerio.utils.HTTPChannel, p2 : Client) : Void;
	function add(p1 : Int, ?p2 : flash.utils.Function, ?p3 : flash.utils.Function) : Void;
	function load(p1 : Array<Dynamic>, ?p2 : flash.utils.Function, ?p3 : flash.utils.Function) : Void;
	function refresh(?p1 : flash.utils.Function, ?p2 : flash.utils.Function) : Void;
	function set(p1 : Int, ?p2 : flash.utils.Function, ?p3 : flash.utils.Function) : Void;
}
