package playerio.generated;

extern class QuickConnect extends flash.events.EventDispatcher {
	function new(p1 : playerio.utils.HTTPChannel) : Void;
	function simpleGetCaptcha(p1 : String, p2 : Int, p3 : Int, ?p4 : flash.utils.Function, ?p5 : flash.utils.Function) : Void;
	function simpleRecoverPassword(p1 : String, p2 : String, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function simpleUserGetSecureLoginInfo(?p1 : flash.utils.Function, ?p2 : flash.utils.Function) : Void;
	function steamConnect(p1 : String, p2 : String, p3 : String, p4 : Array<Dynamic>, p5 : String, p6 : flash.utils.Object, ?p7 : flash.utils.Function, ?p8 : flash.utils.Function) : Void;
}
