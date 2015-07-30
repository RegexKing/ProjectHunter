package playerio.generated.messages;

@:final extern class WriteErrorArgs extends com.protobuf.Message {
	var details : String;
	var error : String;
	var extraData : Array<Dynamic>;
	var extraDataDummy : KeyValuePair;
	var source : String;
	var stacktrace : String;
	function new(p1 : String, p2 : String, p3 : String, p4 : String, p5 : Array<Dynamic>) : Void;
}
