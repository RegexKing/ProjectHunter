package playerio.generated.messages;

@:final extern class PayVaultPaymentInfoArgs extends com.protobuf.Message {
	var items : Array<Dynamic>;
	var itemsDummy : PayVaultBuyItemInfo;
	var provider : String;
	var purchaseArguments : Array<Dynamic>;
	var purchaseArgumentsDummy : KeyValuePair;
	function new(p1 : String, p2 : Array<Dynamic>, p3 : Array<Dynamic>) : Void;
}
