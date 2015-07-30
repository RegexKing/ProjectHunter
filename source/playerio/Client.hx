package playerio;

extern class Client {
	var _internal_social(default,never) : Social;
	var achievements(default,never) : Achievements;
	var bigDB(default,never) : BigDB;
	var channel(default,never) : playerio.utils.HTTPChannel;
	var connectUserId(default,never) : String;
	var errorLog(default,never) : ErrorLog;
	var gameFS(default,never) : GameFS;
	var gameId(default,never) : String;
	var gameRequests(default,never) : GameRequests;
	var multiplayer(default,never) : Multiplayer;
	var notifications(default,never) : Notifications;
	var oneScore(default,never) : OneScore;
	var payVault(default,never) : PayVault;
	var playerInsight(default,never) : PlayerInsight;
	var showBranding(default,never) : Bool;
	var stage(default,never) : flash.display.Stage;
	var yahoo(default,never) : Yahoo;
	function new(p1 : flash.display.Stage, p2 : playerio.utils.HTTPChannel, p3 : String, p4 : String, p5 : String, p6 : String, p7 : Bool, p8 : playerio.generated.messages.PlayerInsightState) : Void;
	function handleCallbackError(p1 : String, p2 : flash.errors.Error) : Void;
	function handleCallbackErrorVerbose(p1 : String, p2 : flash.errors.Error) : Void;
	function handleSystemError(p1 : String, p2 : flash.errors.Error, p3 : flash.utils.Object) : Void;
	function toString() : String;
}
