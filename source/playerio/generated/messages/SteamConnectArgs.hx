package playerio.generated.messages;

@:final extern class SteamConnectArgs extends com.protobuf.Message {
	var clientAPI : String;
	var clientInfo : Array<Dynamic>;
	var clientInfoDummy : KeyValuePair;
	var gameId : String;
	var playerInsightSegments : Array<Dynamic>;
	var steamAppId : String;
	var steamSessionTicket : String;
	function new(p1 : String, p2 : String, p3 : String, p4 : Array<Dynamic>, p5 : String, p6 : Array<Dynamic>) : Void;
}
