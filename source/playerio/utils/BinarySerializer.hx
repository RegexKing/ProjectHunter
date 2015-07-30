package playerio.utils;

extern class BinarySerializer extends flash.events.EventDispatcher {
	function new() : Void;
	function AddByte(p1 : UInt) : Void;
	function AddBytes(p1 : flash.utils.ByteArray) : Void;
	function Serialize(p1 : Dynamic) : flash.utils.ByteArray;
	function SerializeMessage(p1 : playerio.Message) : flash.utils.ByteArray;
	static var BooleanFalsePattern : UInt;
	static var BooleanTruePattern : UInt;
	static var ByteArrayPattern : UInt;
	static var DoublePattern : UInt;
	static var FloatPattern : UInt;
	static var IntPattern : UInt;
	static var LongPattern : UInt;
	static var ON_MESSAGE : String;
	static var ShortByteArrayPattern : UInt;
	static var ShortStringPattern : UInt;
	static var ShortUnsignedIntPattern : UInt;
	static var StringPattern : UInt;
	static var UnsignedIntPattern : UInt;
	static var UnsignedLongPattern : UInt;
}
