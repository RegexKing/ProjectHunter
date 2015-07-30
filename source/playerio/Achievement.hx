package playerio;

extern class Achievement {
	var completed(default,never) : Bool;
	var description(default,never) : String;
	var id(default,never) : String;
	var imageUrl(default,never) : String;
	var lastUpdated(default,never) : Date;
	var progress(default,never) : Int;
	var progressGoal(default,never) : Int;
	var progressRatio(default,never) : Float;
	var title(default,never) : String;
	function new() : Void;
	function _internal_initialize(p1 : playerio.generated.messages.Achievement) : Void;
}
