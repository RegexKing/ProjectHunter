package playerio;

extern class Message {
	var length(default,never) : Int;
	var type : String;
	function new(p1 : String, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic, ?p6 : Dynamic) : Void;
	function add(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void;
	function clone(p1 : flash.utils.Object) : Void;
	function getBoolean(p1 : Int) : Bool;
	function getByteArray(p1 : Int) : flash.utils.ByteArray;
	function getInt(p1 : Int) : Int;
	function getNumber(p1 : Int) : Float;
	function getObject(p1 : Int) : Dynamic;
	function getString(p1 : Int) : String;
	function getUInt(p1 : Int) : UInt;
	function toString() : String;
}
