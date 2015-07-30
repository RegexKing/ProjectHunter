package playerio;

extern class DatabaseObject implements Dynamic {
	var key(default,never) : String;
	var table(default,never) : String;
	function new(p1 : String, p2 : String, p3 : String, p4 : UInt, p5 : Bool, p6 : Dynamic) : Void;
	function commit() : Void;
	function save(p1 : Bool = false, p2 : Bool = false, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function toString() : String;
}
