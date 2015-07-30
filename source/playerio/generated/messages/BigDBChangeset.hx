package playerio.generated.messages;

@:final extern class BigDBChangeset extends com.protobuf.Message {
	var changes : Array<Dynamic>;
	var changesDummy : ObjectProperty;
	var fullOverwrite : Bool;
	var key : String;
	var onlyIfVersion : String;
	var table : String;
	function new() : Void;
}
