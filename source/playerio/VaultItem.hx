package playerio;

extern class VaultItem implements Dynamic {
	var id(default,never) : String;
	var itemKey(default,never) : String;
	var purchaseDate(default,never) : Date;
	function new(p1 : String, p2 : String, p3 : Date) : Void;
	function toString() : String;
}
