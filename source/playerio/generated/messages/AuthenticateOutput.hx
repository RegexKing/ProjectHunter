package playerio.generated.messages;

@:final extern class AuthenticateOutput extends com.protobuf.Message {
	var gameFSRedirectMap : String;
	var isSocialNetworkUser : Bool;
	var newPlayCodes : Array<Dynamic>;
	var notificationClickPayload : String;
	var playerInsightState : PlayerInsightState;
	var playerInsightStateDummy : PlayerInsightState;
	var showBranding : Bool;
	var startDialogs : Array<Dynamic>;
	var startDialogsDummy : AuthenticateStartDialog;
	var token : String;
	var userId : String;
	function new() : Void;
}
