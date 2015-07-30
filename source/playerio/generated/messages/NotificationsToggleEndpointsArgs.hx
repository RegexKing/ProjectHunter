package playerio.generated.messages;

@:final extern class NotificationsToggleEndpointsArgs extends com.protobuf.Message {
	var enabled : Bool;
	var endpoints : Array<Dynamic>;
	var endpointsDummy : NotificationsEndpointId;
	var lastVersion : String;
	function new(p1 : String, p2 : Array<Dynamic>, p3 : Bool) : Void;
}
