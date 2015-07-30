package playerio;

extern class Social extends playerio.generated.Social {
	function new(p1 : playerio.utils.HTTPChannel, p2 : Client) : Void;
	function loadProfile(p1 : Array<Dynamic>, p2 : flash.utils.Function, p3 : flash.utils.Function) : Void;
	function refresh(p1 : flash.utils.Function, p2 : flash.utils.Function) : Void;
}
