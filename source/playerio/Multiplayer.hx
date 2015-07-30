package playerio;

extern class Multiplayer extends playerio.generated.Multiplayer {
	var developmentServer : String;
	function new(p1 : playerio.utils.HTTPChannel, p2 : Client) : Void;
	function createJoinRoom(p1 : String, p2 : String, p3 : Bool, p4 : flash.utils.Object, p5 : flash.utils.Object, ?p6 : flash.utils.Function, ?p7 : flash.utils.Function) : Void;
	function createRoom(p1 : String, p2 : String, p3 : Bool, p4 : flash.utils.Object, ?p5 : flash.utils.Function, ?p6 : flash.utils.Function) : Void;
	function joinRoom(p1 : String, p2 : flash.utils.Object, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function listRooms(p1 : String, p2 : flash.utils.Object, p3 : Int, p4 : Int, ?p5 : flash.utils.Function, ?p6 : flash.utils.Function) : Void;
}
