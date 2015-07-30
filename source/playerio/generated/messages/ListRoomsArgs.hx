package playerio.generated.messages;

@:final extern class ListRoomsArgs extends com.protobuf.Message {
	var onlyDevRooms : Bool;
	var resultLimit : Int;
	var resultOffset : Int;
	var roomType : String;
	var searchCriteria : Array<Dynamic>;
	var searchCriteriaDummy : KeyValuePair;
	function new(p1 : String, p2 : Array<Dynamic>, p3 : Int, p4 : Int, p5 : Bool) : Void;
}
