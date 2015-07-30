package playerio;

extern class PlayerIORegistrationError extends PlayerIOError {
	var captchaError : String;
	var emailError : String;
	var passwordError : String;
	var usernameError : String;
	function new(p1 : String, p2 : Int, p3 : String, p4 : String, p5 : String, p6 : String) : Void;
}
