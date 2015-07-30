package playerio.generated.messages;

@:final extern class KongregateConnectArgs extends com.protobuf.Message {
	var clientAPI : String;
	var clientInfo : Array<Dynamic>;
	var clientInfoDummy : KeyValuePair;
	var gameAuthToken : String;
	var gameId : String;
	var playerInsightSegments : Array<Dynamic>;
	var userId : String;
	function new(p1 : String, p2 : String, p3 : String, p4 : Array<Dynamic>, p5 : String, p6 : Array<Dynamic>) : Void;
}
