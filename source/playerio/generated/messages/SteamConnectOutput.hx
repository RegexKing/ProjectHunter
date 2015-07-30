package playerio.generated.messages;

@:final extern class SteamConnectOutput extends com.protobuf.Message {
	var gameFSRedirectMap : String;
	var partnerId : String;
	var playerInsightState : PlayerInsightState;
	var playerInsightStateDummy : PlayerInsightState;
	var showBranding : Bool;
	var token : String;
	var userId : String;
	function new() : Void;
}
