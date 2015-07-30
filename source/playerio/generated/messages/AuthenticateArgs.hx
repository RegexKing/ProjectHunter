package playerio.generated.messages;

@:final extern class AuthenticateArgs extends com.protobuf.Message {
	var authenticationArguments : Array<Dynamic>;
	var authenticationArgumentsDummy : KeyValuePair;
	var clientAPI : String;
	var clientInfo : Array<Dynamic>;
	var clientInfoDummy : KeyValuePair;
	var connectionId : String;
	var gameId : String;
	var playCodes : Array<Dynamic>;
	var playerInsightSegments : Array<Dynamic>;
	function new(p1 : String, p2 : String, p3 : Array<Dynamic>, p4 : Array<Dynamic>, p5 : String, p6 : Array<Dynamic>, p7 : Array<Dynamic>) : Void;
}
