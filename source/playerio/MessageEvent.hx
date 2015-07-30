package playerio;

extern class MessageEvent extends flash.events.Event {
	var message : Message;
	function new(p1 : String, p2 : Message) : Void;
	static var ON_MESSAGE : String;
}
