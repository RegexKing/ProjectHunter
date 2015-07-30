package playerio.generated.messages;

@:final extern class SimpleRegisterArgs extends com.protobuf.Message {
	var captchaKey : String;
	var captchaValue : String;
	var clientAPI : String;
	var clientInfo : Array<Dynamic>;
	var clientInfoDummy : KeyValuePair;
	var email : String;
	var extraData : Array<Dynamic>;
	var extraDataDummy : KeyValuePair;
	var gameId : String;
	var partnerId : String;
	var password : String;
	var playerInsightSegments : Array<Dynamic>;
	var username : String;
	function new(p1 : String, p2 : String, p3 : String, p4 : String, p5 : String, p6 : String, p7 : Array<Dynamic>, p8 : String, p9 : Array<Dynamic>, p10 : String, p11 : Array<Dynamic>) : Void;
}
