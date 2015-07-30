package playerio.utils;

extern class Utilities {
	function new() : Void;
	static var clientAPI : String;
	static function converter(p1 : Array<Dynamic>, p2 : Dynamic) : Array<Dynamic>;
	static function countKeys(p1 : Dynamic) : Int;
	static function find(p1 : Array<Dynamic>, p2 : Dynamic) : Dynamic;
	static function getSystemInfo() : Dynamic;
	static function getSystemInfoString() : String;
}
