package playerio.generated.messages;

@:final extern class SaveObjectChangesArgs extends com.protobuf.Message {
	var changesets : Array<Dynamic>;
	var changesetsDummy : BigDBChangeset;
	var createIfMissing : Bool;
	var lockType : Int;
	function new(p1 : Int, p2 : Array<Dynamic>, p3 : Bool) : Void;
}
