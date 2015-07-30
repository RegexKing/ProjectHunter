package playerio;

extern class GameRequest {
	var _internal_id(default,never) : String;
	var created(default,never) : Date;
	var data(default,never) : Dynamic;
	var senderUserId(default,never) : String;
	var type(default,never) : String;
	function new() : Void;
	function _internal_initialize(p1 : playerio.generated.messages.WaitingGameRequest) : Void;
}
