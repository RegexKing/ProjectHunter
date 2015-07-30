package playerio;

extern class PayVaultHistoryEntry implements Dynamic {
	var amount(default,never) : Int;
	var itemKeys(default,never) : Array<Dynamic>;
	var providerPrice(default,never) : String;
	var providerTransactionId(default,never) : String;
	var reason(default,never) : String;
	var timestamp(default,never) : Date;
	var type(default,never) : String;
	function new(p1 : Int, p2 : String, p3 : Date, p4 : Array<Dynamic>, p5 : String, p6 : String, p7 : String) : Void;
	function toString() : String;
}
