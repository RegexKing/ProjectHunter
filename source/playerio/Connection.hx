package playerio;

extern class Connection {
	var connected(default,never) : Bool;
	var roomId : String;
	function new(p1 : Client, p2 : String, p3 : String, p4 : Array<Dynamic>, p5 : Dynamic, p6 : Dynamic, p7 : Dynamic, p8 : String) : Void;
	function addDisconnectHandler(p1 : flash.utils.Function) : Void;
	function addMessageHandler(p1 : String, p2 : flash.utils.Function) : Void;
	function createMessage(p1 : String, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic, ?p6 : Dynamic) : Message;
	function disconnect() : Void;
	function removeDisconnectHandler(p1 : flash.utils.Function) : Void;
	function removeMessageHandler(p1 : String, p2 : flash.utils.Function) : Void;
	function send(p1 : String, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic, ?p6 : Dynamic) : Void;
	function sendMessage(p1 : Message) : Void;
	static function encode(p1 : flash.utils.ByteArray) : String;
}
