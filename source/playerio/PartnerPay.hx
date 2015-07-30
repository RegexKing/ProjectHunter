package playerio;

extern class PartnerPay extends playerio.generated.PartnerPay {
	var currentPartner(default,never) : String;
	function new(p1 : playerio.utils.HTTPChannel, p2 : Client, p3 : String) : Void;
	function setTag(p1 : String, ?p2 : flash.utils.Function, ?p3 : flash.utils.Function) : Void;
	function trigger(p1 : String, p2 : UInt, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
}
