package playerio.utils;

extern class Converter {
	function new() : Void;
	static function getObjectProperties(p1 : Dynamic, p2 : Bool = false, ?p3 : String) : Array<Dynamic>;
	static function toBigDBObject(p1 : String, p2 : String, p3 : Int, p4 : Dynamic) : playerio.generated.messages.BigDBObject;
	static function toBuyItemInfoArray(p1 : Array<Dynamic>) : Array<Dynamic>;
	static function toDatabaseObject(p1 : String, p2 : playerio.generated.messages.BigDBObject, p3 : Bool, p4 : Dynamic) : playerio.DatabaseObject;
	static function toKeyValueArray(p1 : Dynamic) : Array<Dynamic>;
	static function toKeyValueObject(p1 : Array<Dynamic>) : Dynamic;
	static function toNewBigDBObject(p1 : String, p2 : String, p3 : Dynamic) : playerio.generated.messages.NewBigDBObject;
	static function toPayVaultHistoryEntryArray(p1 : Array<Dynamic>) : Array<Dynamic>;
	static function toRoomInfoArray(p1 : Array<Dynamic>) : Array<Dynamic>;
	static function toSparseBigDBObject(p1 : String, p2 : String, p3 : Int, p4 : Dynamic) : playerio.generated.messages.BigDBObject;
	static function toValueObjectArray(p1 : Array<Dynamic>) : Array<Dynamic>;
	static function toVaultItemArray(p1 : Array<Dynamic>) : Array<Dynamic>;
}
