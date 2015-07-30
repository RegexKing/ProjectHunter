package playerio;

extern class Notification {
	var data(default,never) : Dynamic;
	var endpointType(default,never) : String;
	var recipientUserId(default,never) : String;
	function new(p1 : String, p2 : String) : Void;
	function set(p1 : String, p2 : String) : Notification;
}
