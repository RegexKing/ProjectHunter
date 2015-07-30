package playerio;

extern class GameRequests extends playerio.generated.GameRequests {
	var waitingRequests(default,never) : Array<Dynamic>;
	function new(p1 : playerio.utils.HTTPChannel, p2 : Client) : Void;
	function refresh(p1 : flash.utils.Function, p2 : flash.utils.Function) : Void;
	function remove(p1 : Array<Dynamic>, p2 : flash.utils.Function, p3 : flash.utils.Function) : Void;
	function send(p1 : String, p2 : flash.utils.Object, p3 : Array<Dynamic>, p4 : flash.utils.Function, p5 : flash.utils.Function) : Void;
	function showSendDialog(p1 : String, p2 : flash.utils.Object, p3 : flash.utils.Function) : Void;
}
