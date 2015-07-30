package playerio;

extern class ErrorLog extends playerio.generated.ErrorLog {
	function new(p1 : playerio.utils.HTTPChannel, p2 : Client) : Void;
	function _internal_writeSystemError(p1 : String, p2 : String, p3 : String, p4 : flash.utils.Object, ?p5 : flash.utils.Function, ?p6 : flash.utils.Function) : Void;
	function writeError(p1 : String, p2 : String, p3 : String, p4 : flash.utils.Object, ?p5 : flash.utils.Function, ?p6 : flash.utils.Function) : Void;
}
