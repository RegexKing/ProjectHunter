package playerio.utils;

extern class SWFReader {
	var asVersion : UInt;
	var backgroundColor : UInt;
	var compressed : Bool;
	var debuggerEnabled : Bool;
	var dimensions(default,never) : flash.geom.Rectangle;
	var errorText : String;
	var fileSize : UInt;
	var frameRate : UInt;
	var hardwareAcceleration : UInt;
	var height(default,never) : UInt;
	var metadata : flash.xml.XML;
	var parsed : Bool;
	var protectedFromImport : Bool;
	var recursionLimit : UInt;
	var scriptTimeoutLimit : UInt;
	var tagCallback : Dynamic;
	var tagCallbackBytesIncludesHeader : Bool;
	var totalFrames : UInt;
	var usesNetwork : Bool;
	var version : UInt;
	var width(default,never) : UInt;
	function new(?p1 : flash.utils.ByteArray) : Void;
	function parse(p1 : flash.utils.ByteArray) : Void;
	function toString() : String;
}
