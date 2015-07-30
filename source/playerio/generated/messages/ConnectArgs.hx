package playerio.generated.messages;

@:final extern class ConnectArgs extends com.protobuf.Message {
	var auth : String;
	var clientAPI : String;
	var clientInfo : Array<Dynamic>;
	var clientInfoDummy : KeyValuePair;
	var connectionId : String;
	var gameId : String;
	var partnerId : String;
	var playerInsightSegments : Array<Dynamic>;
	var userId : String;
	function new(p1 : String, p2 : String, p3 : String, p4 : String, p5 : String, p6 : Array<Dynamic>, p7 : String, p8 : Array<Dynamic>) : Void;
}
