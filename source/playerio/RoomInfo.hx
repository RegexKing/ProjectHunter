package playerio;

extern class RoomInfo {
	var data(default,never) : Dynamic;
	var id(default,never) : String;
	var initData(default,never) : Dynamic;
	var onlineUsers(default,never) : Int;
	var roomType(default,never) : String;
	var serverType(default,never) : String;
	function new(p1 : String, p2 : String, p3 : Int, p4 : Dynamic) : Void;
	function toString() : String;
}
