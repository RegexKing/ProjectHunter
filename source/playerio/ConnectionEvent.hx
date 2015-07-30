package playerio;

extern class ConnectionEvent extends flash.events.Event {
	function new(p1 : String) : Void;
	static var CLOSE : String;
	static var CONNECTED : String;
}
