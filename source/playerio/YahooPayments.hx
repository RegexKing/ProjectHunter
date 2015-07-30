package playerio;

extern class YahooPayments {
	function new(p1 : Client) : Void;
	function showBuyCoinsDialog(p1 : Int, p2 : flash.utils.Object, p3 : flash.utils.Function, p4 : flash.utils.Function) : Void;
	function showBuyItemsDialog(p1 : Array<Dynamic>, p2 : flash.utils.Object, p3 : flash.utils.Function, p4 : flash.utils.Function) : Void;
}
