package playerio;

extern class QuickConnect extends playerio.generated.QuickConnect {
	function new(p1 : playerio.utils.HTTPChannel) : Void;
	function facebookConnect(p1 : flash.display.Stage, p2 : String, p3 : String, p4 : String, ?p5 : Dynamic, ?p6 : Dynamic, ?p7 : Dynamic, ?p8 : Dynamic) : Void;
	function facebookConnectPopup(p1 : flash.display.Stage, p2 : String, p3 : String, ?p4 : Array<Dynamic>, ?p5 : Dynamic, ?p6 : Dynamic, ?p7 : Dynamic) : Void;
	function facebookOAuthConnect(p1 : flash.display.Stage, p2 : String, p3 : String, ?p4 : Dynamic, ?p5 : Dynamic, ?p6 : Dynamic, ?p7 : Dynamic) : Void;
	function facebookOAuthConnectPopup(p1 : flash.display.Stage, p2 : String, p3 : String, ?p4 : Array<Dynamic>, ?p5 : Dynamic, ?p6 : Dynamic, ?p7 : Dynamic, ?p8 : Dynamic) : Void;
	function kongregateConnect(p1 : flash.display.Stage, p2 : String, p3 : String, p4 : String, ?p5 : Dynamic, ?p6 : Dynamic, ?p7 : Dynamic) : Void;
	function simpleConnect(p1 : flash.display.Stage, p2 : String, p3 : String, p4 : String, ?p5 : Dynamic, ?p6 : Dynamic, ?p7 : Dynamic) : Void;
	function simpleRegister(p1 : flash.display.Stage, p2 : String, p3 : String, p4 : String, p5 : String, p6 : String, p7 : String, p8 : flash.utils.Object, ?p9 : Dynamic, ?p10 : Dynamic, ?p11 : Dynamic, ?p12 : Dynamic) : Void;
}
