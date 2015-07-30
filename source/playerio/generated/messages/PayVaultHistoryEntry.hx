package playerio.generated.messages;

@:final extern class PayVaultHistoryEntry extends com.protobuf.Message {
	var amount : Int;
	var itemKeys : Array<Dynamic>;
	var providerPrice : String;
	var providerTransactionId : String;
	var reason : String;
	var timestamp : Float;
	var type : String;
	function new() : Void;
}
