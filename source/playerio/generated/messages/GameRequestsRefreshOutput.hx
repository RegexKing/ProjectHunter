package playerio.generated.messages;

@:final extern class GameRequestsRefreshOutput extends com.protobuf.Message {
	var moreRequestsWaiting : Bool;
	var newPlayCodes : Array<Dynamic>;
	var requests : Array<Dynamic>;
	var requestsDummy : WaitingGameRequest;
	function new() : Void;
}
