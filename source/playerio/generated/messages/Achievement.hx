package playerio.generated.messages;

@:final extern class Achievement extends com.protobuf.Message {
	var description : String;
	var identifier : String;
	var imageUrl : String;
	var lastUpdated : Float;
	var progress : UInt;
	var progressGoal : UInt;
	var title : String;
	function new() : Void;
}
