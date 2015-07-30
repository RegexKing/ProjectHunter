package playerio;

extern class YahooProfiles {
	var myProfile(default,never) : YahooProfile;
	function new(p1 : Client) : Void;
	function _internal_refreshed(p1 : YahooProfile) : Void;
	function loadProfiles(p1 : Array<Dynamic>, p2 : flash.utils.Function, p3 : flash.utils.Function) : Void;
	function showProfile(p1 : String, p2 : flash.utils.Function) : Void;
}
