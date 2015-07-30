package playerio;

extern class Yahoo extends flash.events.EventDispatcher {
	var payments(default,never) : YahooPayments;
	var profiles(default,never) : YahooProfiles;
	var relations(default,never) : YahooRelations;
	function new(p1 : Client) : Void;
	function refresh(p1 : flash.utils.Function, p2 : flash.utils.Function) : Void;
	static function _internal_showDialog(p1 : String, p2 : Dynamic, p3 : playerio.utils.HTTPChannel, p4 : Dynamic) : Void;
}
