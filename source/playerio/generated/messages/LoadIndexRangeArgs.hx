package playerio.generated.messages;

@:final extern class LoadIndexRangeArgs extends com.protobuf.Message {
	var index : String;
	var limit : Int;
	var startIndexValue : Array<Dynamic>;
	var startIndexValueDummy : ValueObject;
	var stopIndexValue : Array<Dynamic>;
	var stopIndexValueDummy : ValueObject;
	var table : String;
	function new(p1 : String, p2 : String, p3 : Array<Dynamic>, p4 : Array<Dynamic>, p5 : Int) : Void;
}
