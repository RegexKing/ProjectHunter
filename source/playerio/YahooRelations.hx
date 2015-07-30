package playerio;

extern class YahooRelations {
	var friends(default,never) : Array<Dynamic>;
	function new(p1 : Client, p2 : Yahoo) : Void;
	function _internal_refreshed(p1 : playerio.generated.messages.SocialProfile, p2 : Array<Dynamic>, p3 : Array<Dynamic>) : Void;
	function isBlocked(p1 : String) : Bool;
	function isFiend(p1 : String) : Bool;
	function showBlockedUsersManager(p1 : flash.utils.Function) : Void;
	function showFriendsManager(p1 : flash.utils.Function) : Void;
	function showRequestBlockUserDialog(p1 : String, p2 : flash.utils.Function) : Void;
	function showRequestFriendshipDialog(p1 : String, p2 : flash.utils.Function) : Void;
}
