package playerio.generated.messages;

@:final extern class FacebookOAuthConnectArgs extends com.protobuf.Message {
	var accessToken : String;
	var clientAPI : String;
	var clientInfo : Array<Dynamic>;
	var clientInfoDummy : KeyValuePair;
	var gameId : String;
	var partnerId : String;
	var playerInsightSegments : Array<Dynamic>;
	function new(p1 : String, p2 : String, p3 : String, p4 : Array<Dynamic>, p5 : String, p6 : Array<Dynamic>) : Void;
}
