package playerio;

extern class YahooProfile {
	var avatarUrl(default,never) : String;
	var countryCode(default,never) : String;
	var displayName(default,never) : String;
	var lastOnline(default,never) : Date;
	var userId(default,never) : String;
	function new() : Void;
	function _internal_initialize(p1 : playerio.generated.messages.SocialProfile) : Void;
}
