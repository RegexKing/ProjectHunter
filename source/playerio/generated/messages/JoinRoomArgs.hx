package playerio.generated.messages;

@:final extern class JoinRoomArgs extends com.protobuf.Message {
	var isDevRoom : Bool;
	var joinData : Array<Dynamic>;
	var joinDataDummy : KeyValuePair;
	var roomId : String;
	function new(p1 : String, p2 : Array<Dynamic>, p3 : Bool) : Void;
}
