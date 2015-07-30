package playerio;

extern class PayVault extends playerio.generated.PayVault {
	var coins(default,never) : Float;
	var items(default,never) : Array<Dynamic>;
	function new(p1 : playerio.utils.HTTPChannel, p2 : Client) : Void;
	function buy(p1 : Array<Dynamic>, p2 : Bool, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function consume(p1 : Array<Dynamic>, ?p2 : flash.utils.Function, ?p3 : flash.utils.Function) : Void;
	function count(p1 : String) : UInt;
	function credit(p1 : UInt, p2 : String, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function debit(p1 : UInt, p2 : String, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function first(p1 : String) : VaultItem;
	function getBuyCoinsInfo(p1 : String, p2 : flash.utils.Object, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function getBuyDirectInfo(p1 : String, p2 : flash.utils.Object, p3 : Array<Dynamic>, ?p4 : flash.utils.Function, ?p5 : flash.utils.Function) : Void;
	function give(p1 : Array<Dynamic>, ?p2 : flash.utils.Function, ?p3 : flash.utils.Function) : Void;
	function has(p1 : String) : Bool;
	function readHistory(p1 : UInt, p2 : UInt, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function refresh(?p1 : flash.utils.Function, ?p2 : flash.utils.Function) : Void;
	function usePaymentInfo(p1 : String, p2 : flash.utils.Object, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
}
