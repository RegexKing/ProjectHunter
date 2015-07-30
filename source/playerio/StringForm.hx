package playerio;

extern class StringForm {
	function new() : Void;
	static function decodeStringArray(p1 : String) : Array<Dynamic>;
	static function decodeStringDictionary(p1 : String) : Dynamic;
	static function encodeStringDictionary(p1 : Dynamic) : String;
}
