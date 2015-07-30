package playerio;

extern class PlayerIO extends playerio.generated.PlayerIO {
	function new() : Void;
	static var inside(default,never) : Dynamic;
	static var quickConnect(default,never) : QuickConnect;
	static var useSecureApiRequests : Bool;
	static function authenticate(p1 : flash.display.Stage, p2 : String, p3 : String, p4 : Dynamic, ?p5 : Dynamic, ?p6 : Dynamic, ?p7 : Dynamic) : Void;
	static function connect(p1 : flash.display.Stage, p2 : String, p3 : String, p4 : String, p5 : String, ?p6 : Dynamic, ?p7 : Dynamic, ?p8 : Dynamic, ?p9 : Dynamic) : Void;
	static function gameFS(p1 : String) : GameFS;
	static function getChannel() : playerio.utils.HTTPChannel;
}
