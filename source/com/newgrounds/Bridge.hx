package com.newgrounds;

extern class Bridge extends flash.events.EventDispatcher {
	var widgetId(default,never) : String;
	function new(p1 : String) : Void;
	function receiveEvent(p1 : String) : Void;
	function sendEvent(p1 : String, p2 : flash.utils.Object) : Void;
}
