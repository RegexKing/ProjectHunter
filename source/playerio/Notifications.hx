package playerio;

extern class Notifications extends playerio.generated.Notifications {
	var myNotifications(default,never) : Array<Dynamic>;
	function new(p1 : playerio.utils.HTTPChannel, p2 : Client) : Void;
	function deleteEndpoints(p1 : Array<Dynamic>, p2 : flash.utils.Function, p3 : flash.utils.Function) : Void;
	function refresh(p1 : flash.utils.Function, p2 : flash.utils.Function) : Void;
	function registerEndpoints(p1 : String, p2 : String, p3 : flash.utils.Object, p4 : Bool, p5 : flash.utils.Function, p6 : flash.utils.Function) : Void;
	function send(p1 : Array<Dynamic>, p2 : flash.utils.Function, p3 : flash.utils.Function) : Void;
	function toggleEndpoints(p1 : Array<Dynamic>, p2 : Bool, p3 : flash.utils.Function, p4 : flash.utils.Function) : Void;
}
