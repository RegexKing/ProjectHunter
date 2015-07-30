package playerio.generated.messages;

@:final extern class WriteSystemErrorArgs extends com.protobuf.Message {
	var details : String;
	var error : String;
	var machineName : String;
	var source : String;
	var stacktrace : String;
	var version : String;
	function new(p1 : String, p2 : String, p3 : String, p4 : String, p5 : String, p6 : String) : Void;
}
