package playerio;

extern class NotificationEndpoint {
	var configuration(default,never) : Dynamic;
	var endabled(default,never) : Bool;
	var identifier(default,never) : String;
	var type(default,never) : String;
	function new() : Void;
	function _internal_initialize(p1 : playerio.generated.messages.NotificationsEndpoint) : Void;
}
