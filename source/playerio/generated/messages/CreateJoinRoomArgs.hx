package playerio.generated.messages;

@:final extern class CreateJoinRoomArgs extends com.protobuf.Message {
	var isDevRoom : Bool;
	var joinData : Array<Dynamic>;
	var joinDataDummy : KeyValuePair;
	var roomData : Array<Dynamic>;
	var roomDataDummy : KeyValuePair;
	var roomId : String;
	var roomType : String;
	var visible : Bool;
	function new(p1 : String, p2 : String, p3 : Bool, p4 : Array<Dynamic>, p5 : Array<Dynamic>, p6 : Bool) : Void;
}
