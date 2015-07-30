package playerio;

extern class BigDB extends playerio.generated.BigDB {
	function new(p1 : playerio.utils.HTTPChannel, p2 : Client) : Void;
	function createObject(p1 : String, p2 : String, p3 : flash.utils.Object, ?p4 : flash.utils.Function, ?p5 : flash.utils.Function) : Void;
	function deleteKeys(p1 : String, p2 : Array<Dynamic>, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function deleteRange(p1 : String, p2 : String, p3 : Array<Dynamic>, p4 : flash.utils.Object, p5 : flash.utils.Object, ?p6 : flash.utils.Function, ?p7 : flash.utils.Function) : Void;
	function load(p1 : String, p2 : String, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function loadKeys(p1 : String, p2 : Array<Dynamic>, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function loadKeysOrCreate(p1 : String, p2 : Array<Dynamic>, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function loadMyPlayerObject(?p1 : flash.utils.Function, ?p2 : flash.utils.Function) : Void;
	function loadOrCreate(p1 : String, p2 : String, ?p3 : flash.utils.Function, ?p4 : flash.utils.Function) : Void;
	function loadRange(p1 : String, p2 : String, p3 : Array<Dynamic>, p4 : flash.utils.Object, p5 : flash.utils.Object, p6 : Int, ?p7 : flash.utils.Function, ?p8 : flash.utils.Function) : Void;
	function loadSingle(p1 : String, p2 : String, p3 : Array<Dynamic>, ?p4 : flash.utils.Function, ?p5 : flash.utils.Function) : Void;
}
