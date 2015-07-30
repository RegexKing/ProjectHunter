package playerio;

extern class OneScoreValue {
	var percentile(default,never) : Float;
	var score(default,never) : Int;
	var topRank(default,never) : Int;
	function new() : Void;
	function _internal_initialize(p1 : playerio.generated.messages.OneScoreValue) : Void;
}
