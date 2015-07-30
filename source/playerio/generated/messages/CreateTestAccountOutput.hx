package playerio.generated.messages;

@:final extern class CreateTestAccountOutput extends com.protobuf.Message {
	var accountId : Int;
	var authKeyForBob : String;
	var authKeyForJohn : String;
	var authKeyForJulie : String;
	var authSharedSecret : String;
	var captchaTestGameId : String;
	var partnerId1 : String;
	var partnerId2 : String;
	var testGameId : String;
	var yahooUserTokenForHenrik : String;
	var yahooUserTokenForJonas : String;
	var yahooUserTokenForOliver : String;
	function new() : Void;
}
