package playerio;

extern class PlayerInsight extends playerio.generated.PlayerInsight {
	var playersOnline(default,never) : Int;
	function new(p1 : playerio.utils.HTTPChannel, p2 : Client, p3 : playerio.generated.messages.PlayerInsightState) : Void;
	function getSegment(p1 : String) : String;
	function refresh(?p1 : flash.utils.Function, ?p2 : flash.utils.Function) : Void;
	function setSegments(p1 : Array<Dynamic>, ?p2 : flash.utils.Function, ?p3 : flash.utils.Function) : Void;
	function trackEvents(p1 : Array<Dynamic>, ?p2 : flash.utils.Function, ?p3 : flash.utils.Function) : Void;
	function trackExternalPayment(p1 : String, p2 : Int, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function trackInvitedBy(p1 : String, p2 : String, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
}
