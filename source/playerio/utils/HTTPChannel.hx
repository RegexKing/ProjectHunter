package playerio.utils;

extern class HTTPChannel {
	var headers(never,default) : Array<Dynamic>;
	var token : String;
	function new(p1 : Bool = false) : Void;
	function Request(p1 : Int, p2 : com.protobuf.Message, p3 : com.protobuf.Message, p4 : com.protobuf.Message, p5 : flash.utils.Function, p6 : flash.utils.Function) : Void;
}
