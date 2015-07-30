package playerio.generated.messages;

@:final extern class SimpleRegisterError extends com.protobuf.Message {
	var captchaError : String;
	var emailError : String;
	var errorCode : Int;
	var message : String;
	var passwordError : String;
	var usernameError : String;
	function new() : Void;
}
