#include <hxcpp.h>

#ifndef INCLUDED_DefaultAssetLibrary
#include <DefaultAssetLibrary.h>
#endif
#ifndef INCLUDED_IMap
#include <IMap.h>
#endif
#ifndef INCLUDED_Type
#include <Type.h>
#endif
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif
#ifndef INCLUDED_haxe_ds_StringMap
#include <haxe/ds/StringMap.h>
#endif
#ifndef INCLUDED_haxe_format_JsonParser
#include <haxe/format/JsonParser.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_openfl__legacy_AssetCache
#include <openfl/_legacy/AssetCache.h>
#endif
#ifndef INCLUDED_openfl__legacy_AssetLibrary
#include <openfl/_legacy/AssetLibrary.h>
#endif
#ifndef INCLUDED_openfl__legacy_AssetType
#include <openfl/_legacy/AssetType.h>
#endif
#ifndef INCLUDED_openfl__legacy_Assets
#include <openfl/_legacy/Assets.h>
#endif
#ifndef INCLUDED_openfl__legacy_IAssetCache
#include <openfl/_legacy/IAssetCache.h>
#endif
#ifndef INCLUDED_openfl__legacy_display_BitmapData
#include <openfl/_legacy/display/BitmapData.h>
#endif
#ifndef INCLUDED_openfl__legacy_display_DisplayObject
#include <openfl/_legacy/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl__legacy_display_DisplayObjectContainer
#include <openfl/_legacy/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_openfl__legacy_display_IBitmapDrawable
#include <openfl/_legacy/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl__legacy_display_InteractiveObject
#include <openfl/_legacy/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl__legacy_display_MovieClip
#include <openfl/_legacy/display/MovieClip.h>
#endif
#ifndef INCLUDED_openfl__legacy_display_Sprite
#include <openfl/_legacy/display/Sprite.h>
#endif
#ifndef INCLUDED_openfl__legacy_events_Event
#include <openfl/_legacy/events/Event.h>
#endif
#ifndef INCLUDED_openfl__legacy_events_EventDispatcher
#include <openfl/_legacy/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl__legacy_events_IEventDispatcher
#include <openfl/_legacy/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_openfl__legacy_media_Sound
#include <openfl/_legacy/media/Sound.h>
#endif
#ifndef INCLUDED_openfl__legacy_text_Font
#include <openfl/_legacy/text/Font.h>
#endif
#ifndef INCLUDED_openfl__legacy_utils_ByteArray
#include <openfl/_legacy/utils/ByteArray.h>
#endif
#ifndef INCLUDED_openfl__legacy_utils_IDataInput
#include <openfl/_legacy/utils/IDataInput.h>
#endif
#ifndef INCLUDED_openfl__legacy_utils_IDataOutput
#include <openfl/_legacy/utils/IDataOutput.h>
#endif
#ifndef INCLUDED_openfl__legacy_utils_IMemoryRange
#include <openfl/_legacy/utils/IMemoryRange.h>
#endif
namespace openfl{
namespace _legacy{

Void Assets_obj::__construct()
{
	return null();
}

//Assets_obj::~Assets_obj() { }

Dynamic Assets_obj::__CreateEmpty() { return  new Assets_obj; }
hx::ObjectPtr< Assets_obj > Assets_obj::__new()
{  hx::ObjectPtr< Assets_obj > result = new Assets_obj();
	result->__construct();
	return result;}

Dynamic Assets_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Assets_obj > result = new Assets_obj();
	result->__construct();
	return result;}

::openfl::_legacy::IAssetCache Assets_obj::cache;

::haxe::ds::StringMap Assets_obj::libraries;

::openfl::_legacy::events::EventDispatcher Assets_obj::dispatcher;

bool Assets_obj::initialized;

Void Assets_obj::addEventListener( ::String type,Dynamic listener,hx::Null< bool >  __o_useCapture,hx::Null< int >  __o_priority,hx::Null< bool >  __o_useWeakReference){
bool useCapture = __o_useCapture.Default(false);
int priority = __o_priority.Default(0);
bool useWeakReference = __o_useWeakReference.Default(false);
	HX_STACK_FRAME("openfl._legacy.Assets","addEventListener",0x9ea1b894,"openfl._legacy.Assets.addEventListener","openfl/_legacy/Assets.hx",49,0x9276b055)
	HX_STACK_ARG(type,"type")
	HX_STACK_ARG(listener,"listener")
	HX_STACK_ARG(useCapture,"useCapture")
	HX_STACK_ARG(priority,"priority")
	HX_STACK_ARG(useWeakReference,"useWeakReference")
{
		HX_STACK_LINE(51)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(53)
		::openfl::_legacy::Assets_obj::dispatcher->addEventListener(type,listener,useCapture,priority,useWeakReference);
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC5(Assets_obj,addEventListener,(void))

bool Assets_obj::dispatchEvent( ::openfl::_legacy::events::Event event){
	HX_STACK_FRAME("openfl._legacy.Assets","dispatchEvent",0x41da67d9,"openfl._legacy.Assets.dispatchEvent","openfl/_legacy/Assets.hx",58,0x9276b055)
	HX_STACK_ARG(event,"event")
	HX_STACK_LINE(60)
	::openfl::_legacy::Assets_obj::initialize();
	HX_STACK_LINE(62)
	return ::openfl::_legacy::Assets_obj::dispatcher->dispatchEvent(event);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Assets_obj,dispatchEvent,return )

bool Assets_obj::exists( ::String id,::openfl::_legacy::AssetType type){
	HX_STACK_FRAME("openfl._legacy.Assets","exists",0x884f5be3,"openfl._legacy.Assets.exists","openfl/_legacy/Assets.hx",67,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_ARG(type,"type")
	HX_STACK_LINE(69)
	::openfl::_legacy::Assets_obj::initialize();
	HX_STACK_LINE(73)
	if (((type == null()))){
		HX_STACK_LINE(75)
		type = ::openfl::_legacy::AssetType_obj::BINARY;
	}
	HX_STACK_LINE(79)
	int _g = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
	HX_STACK_LINE(79)
	::String libraryName = id.substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
	HX_STACK_LINE(80)
	int _g1 = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
	HX_STACK_LINE(80)
	int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
	HX_STACK_LINE(80)
	::String symbolName = id.substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
	HX_STACK_LINE(81)
	::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
	HX_STACK_LINE(83)
	if (((library != null()))){
		HX_STACK_LINE(85)
		return library->exists(symbolName,type);
	}
	HX_STACK_LINE(91)
	return false;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Assets_obj,exists,return )

::openfl::_legacy::display::BitmapData Assets_obj::getBitmapData( ::String id,hx::Null< bool >  __o_useCache){
bool useCache = __o_useCache.Default(true);
	HX_STACK_FRAME("openfl._legacy.Assets","getBitmapData",0x0ba8b2c8,"openfl._legacy.Assets.getBitmapData","openfl/_legacy/Assets.hx",103,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_ARG(useCache,"useCache")
{
		HX_STACK_LINE(105)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(109)
		if (((  (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))) ? bool(::openfl::_legacy::Assets_obj::cache->hasBitmapData(id)) : bool(false) ))){
			HX_STACK_LINE(111)
			::openfl::_legacy::display::BitmapData bitmapData = ::openfl::_legacy::Assets_obj::cache->getBitmapData(id);		HX_STACK_VAR(bitmapData,"bitmapData");
			HX_STACK_LINE(113)
			if ((::openfl::_legacy::Assets_obj::isValidBitmapData(bitmapData))){
				HX_STACK_LINE(115)
				return bitmapData;
			}
		}
		HX_STACK_LINE(121)
		int _g = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(121)
		::String libraryName = id.substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
		HX_STACK_LINE(122)
		int _g1 = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(122)
		int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(122)
		::String symbolName = id.substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
		HX_STACK_LINE(123)
		::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
		HX_STACK_LINE(125)
		if (((library != null()))){
			HX_STACK_LINE(127)
			if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::IMAGE))){
				HX_STACK_LINE(129)
				if ((library->isLocal(symbolName,::openfl::_legacy::AssetType_obj::IMAGE))){
					HX_STACK_LINE(131)
					::openfl::_legacy::display::BitmapData bitmapData = library->getBitmapData(symbolName);		HX_STACK_VAR(bitmapData,"bitmapData");
					HX_STACK_LINE(133)
					if (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))){
						HX_STACK_LINE(135)
						::openfl::_legacy::Assets_obj::cache->setBitmapData(id,bitmapData);
					}
					HX_STACK_LINE(139)
					return bitmapData;
				}
				else{
					HX_STACK_LINE(143)
					::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] BitmapData asset \"") + id) + HX_CSTRING("\" exists, but only asynchronously")),hx::SourceInfo(HX_CSTRING("Assets.hx"),143,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getBitmapData")));
				}
			}
			else{
				HX_STACK_LINE(149)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no BitmapData asset with an ID of \"") + id) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),149,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getBitmapData")));
			}
		}
		else{
			HX_STACK_LINE(155)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),155,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getBitmapData")));
		}
		HX_STACK_LINE(161)
		return null();
	}
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Assets_obj,getBitmapData,return )

::openfl::_legacy::utils::ByteArray Assets_obj::getBytes( ::String id){
	HX_STACK_FRAME("openfl._legacy.Assets","getBytes",0x4eaf25bc,"openfl._legacy.Assets.getBytes","openfl/_legacy/Assets.hx",172,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_LINE(174)
	::openfl::_legacy::Assets_obj::initialize();
	HX_STACK_LINE(178)
	int _g = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
	HX_STACK_LINE(178)
	::String libraryName = id.substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
	HX_STACK_LINE(179)
	int _g1 = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
	HX_STACK_LINE(179)
	int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
	HX_STACK_LINE(179)
	::String symbolName = id.substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
	HX_STACK_LINE(180)
	::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
	HX_STACK_LINE(182)
	if (((library != null()))){
		HX_STACK_LINE(184)
		if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::BINARY))){
			HX_STACK_LINE(186)
			if ((library->isLocal(symbolName,::openfl::_legacy::AssetType_obj::BINARY))){
				HX_STACK_LINE(188)
				return library->getBytes(symbolName);
			}
			else{
				HX_STACK_LINE(192)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] String or ByteArray asset \"") + id) + HX_CSTRING("\" exists, but only asynchronously")),hx::SourceInfo(HX_CSTRING("Assets.hx"),192,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getBytes")));
			}
		}
		else{
			HX_STACK_LINE(198)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no String or ByteArray asset with an ID of \"") + id) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),198,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getBytes")));
		}
	}
	else{
		HX_STACK_LINE(204)
		::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),204,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getBytes")));
	}
	HX_STACK_LINE(210)
	return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Assets_obj,getBytes,return )

::openfl::_legacy::text::Font Assets_obj::getFont( ::String id,hx::Null< bool >  __o_useCache){
bool useCache = __o_useCache.Default(true);
	HX_STACK_FRAME("openfl._legacy.Assets","getFont",0xaf2a159e,"openfl._legacy.Assets.getFont","openfl/_legacy/Assets.hx",221,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_ARG(useCache,"useCache")
{
		HX_STACK_LINE(223)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(227)
		if (((  (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))) ? bool(::openfl::_legacy::Assets_obj::cache->hasFont(id)) : bool(false) ))){
			HX_STACK_LINE(229)
			return ::openfl::_legacy::Assets_obj::cache->getFont(id);
		}
		HX_STACK_LINE(233)
		int _g = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(233)
		::String libraryName = id.substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
		HX_STACK_LINE(234)
		int _g1 = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(234)
		int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(234)
		::String symbolName = id.substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
		HX_STACK_LINE(235)
		::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
		HX_STACK_LINE(237)
		if (((library != null()))){
			HX_STACK_LINE(239)
			if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::FONT))){
				HX_STACK_LINE(241)
				if ((library->isLocal(symbolName,::openfl::_legacy::AssetType_obj::FONT))){
					HX_STACK_LINE(243)
					::openfl::_legacy::text::Font font = library->getFont(symbolName);		HX_STACK_VAR(font,"font");
					HX_STACK_LINE(245)
					if (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))){
						HX_STACK_LINE(247)
						::openfl::_legacy::Assets_obj::cache->setFont(id,font);
					}
					HX_STACK_LINE(251)
					return font;
				}
				else{
					HX_STACK_LINE(255)
					::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] Font asset \"") + id) + HX_CSTRING("\" exists, but only asynchronously")),hx::SourceInfo(HX_CSTRING("Assets.hx"),255,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getFont")));
				}
			}
			else{
				HX_STACK_LINE(261)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no Font asset with an ID of \"") + id) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),261,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getFont")));
			}
		}
		else{
			HX_STACK_LINE(267)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),267,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getFont")));
		}
		HX_STACK_LINE(273)
		return null();
	}
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Assets_obj,getFont,return )

::openfl::_legacy::AssetLibrary Assets_obj::getLibrary( ::String name){
	HX_STACK_FRAME("openfl._legacy.Assets","getLibrary",0x9a85fa8c,"openfl._legacy.Assets.getLibrary","openfl/_legacy/Assets.hx",278,0x9276b055)
	HX_STACK_ARG(name,"name")
	HX_STACK_LINE(280)
	if (((bool((name == null())) || bool((name == HX_CSTRING("")))))){
		HX_STACK_LINE(282)
		name = HX_CSTRING("default");
	}
	HX_STACK_LINE(286)
	return ::openfl::_legacy::Assets_obj::libraries->get(name);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Assets_obj,getLibrary,return )

::openfl::_legacy::display::MovieClip Assets_obj::getMovieClip( ::String id){
	HX_STACK_FRAME("openfl._legacy.Assets","getMovieClip",0xc2f99c71,"openfl._legacy.Assets.getMovieClip","openfl/_legacy/Assets.hx",297,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_LINE(299)
	::openfl::_legacy::Assets_obj::initialize();
	HX_STACK_LINE(303)
	int _g = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
	HX_STACK_LINE(303)
	::String libraryName = id.substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
	HX_STACK_LINE(304)
	int _g1 = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
	HX_STACK_LINE(304)
	int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
	HX_STACK_LINE(304)
	::String symbolName = id.substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
	HX_STACK_LINE(305)
	::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
	HX_STACK_LINE(307)
	if (((library != null()))){
		HX_STACK_LINE(309)
		if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::MOVIE_CLIP))){
			HX_STACK_LINE(311)
			if ((library->isLocal(symbolName,::openfl::_legacy::AssetType_obj::MOVIE_CLIP))){
				HX_STACK_LINE(313)
				return library->getMovieClip(symbolName);
			}
			else{
				HX_STACK_LINE(317)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] MovieClip asset \"") + id) + HX_CSTRING("\" exists, but only asynchronously")),hx::SourceInfo(HX_CSTRING("Assets.hx"),317,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getMovieClip")));
			}
		}
		else{
			HX_STACK_LINE(323)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no MovieClip asset with an ID of \"") + id) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),323,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getMovieClip")));
		}
	}
	else{
		HX_STACK_LINE(329)
		::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),329,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getMovieClip")));
	}
	HX_STACK_LINE(335)
	return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Assets_obj,getMovieClip,return )

::openfl::_legacy::media::Sound Assets_obj::getMusic( ::String id,hx::Null< bool >  __o_useCache){
bool useCache = __o_useCache.Default(true);
	HX_STACK_FRAME("openfl._legacy.Assets","getMusic",0xa171edf6,"openfl._legacy.Assets.getMusic","openfl/_legacy/Assets.hx",346,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_ARG(useCache,"useCache")
{
		HX_STACK_LINE(348)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(352)
		if (((  (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))) ? bool(::openfl::_legacy::Assets_obj::cache->hasSound(id)) : bool(false) ))){
			HX_STACK_LINE(354)
			::openfl::_legacy::media::Sound sound = ::openfl::_legacy::Assets_obj::cache->getSound(id);		HX_STACK_VAR(sound,"sound");
			HX_STACK_LINE(356)
			if ((::openfl::_legacy::Assets_obj::isValidSound(sound))){
				HX_STACK_LINE(358)
				return sound;
			}
		}
		HX_STACK_LINE(364)
		int _g = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(364)
		::String libraryName = id.substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
		HX_STACK_LINE(365)
		int _g1 = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(365)
		int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(365)
		::String symbolName = id.substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
		HX_STACK_LINE(366)
		::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
		HX_STACK_LINE(368)
		if (((library != null()))){
			HX_STACK_LINE(370)
			if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::MUSIC))){
				HX_STACK_LINE(372)
				if ((library->isLocal(symbolName,::openfl::_legacy::AssetType_obj::MUSIC))){
					HX_STACK_LINE(374)
					::openfl::_legacy::media::Sound sound = library->getMusic(symbolName);		HX_STACK_VAR(sound,"sound");
					HX_STACK_LINE(376)
					if (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))){
						HX_STACK_LINE(378)
						::openfl::_legacy::Assets_obj::cache->setSound(id,sound);
					}
					HX_STACK_LINE(382)
					return sound;
				}
				else{
					HX_STACK_LINE(386)
					::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] Sound asset \"") + id) + HX_CSTRING("\" exists, but only asynchronously")),hx::SourceInfo(HX_CSTRING("Assets.hx"),386,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getMusic")));
				}
			}
			else{
				HX_STACK_LINE(392)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no Sound asset with an ID of \"") + id) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),392,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getMusic")));
			}
		}
		else{
			HX_STACK_LINE(398)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),398,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getMusic")));
		}
		HX_STACK_LINE(404)
		return null();
	}
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Assets_obj,getMusic,return )

::String Assets_obj::getPath( ::String id){
	HX_STACK_FRAME("openfl._legacy.Assets","getPath",0xb5bb9d74,"openfl._legacy.Assets.getPath","openfl/_legacy/Assets.hx",415,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_LINE(417)
	::openfl::_legacy::Assets_obj::initialize();
	HX_STACK_LINE(421)
	int _g = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
	HX_STACK_LINE(421)
	::String libraryName = id.substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
	HX_STACK_LINE(422)
	int _g1 = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
	HX_STACK_LINE(422)
	int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
	HX_STACK_LINE(422)
	::String symbolName = id.substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
	HX_STACK_LINE(423)
	::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
	HX_STACK_LINE(425)
	if (((library != null()))){
		HX_STACK_LINE(427)
		if ((library->exists(symbolName,null()))){
			HX_STACK_LINE(429)
			return library->getPath(symbolName);
		}
		else{
			HX_STACK_LINE(433)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset with an ID of \"") + id) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),433,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getPath")));
		}
	}
	else{
		HX_STACK_LINE(439)
		::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),439,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getPath")));
	}
	HX_STACK_LINE(445)
	return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Assets_obj,getPath,return )

::openfl::_legacy::media::Sound Assets_obj::getSound( ::String id,hx::Null< bool >  __o_useCache){
bool useCache = __o_useCache.Default(true);
	HX_STACK_FRAME("openfl._legacy.Assets","getSound",0x11e3aa20,"openfl._legacy.Assets.getSound","openfl/_legacy/Assets.hx",456,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_ARG(useCache,"useCache")
{
		HX_STACK_LINE(458)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(462)
		if (((  (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))) ? bool(::openfl::_legacy::Assets_obj::cache->hasSound(id)) : bool(false) ))){
			HX_STACK_LINE(464)
			::openfl::_legacy::media::Sound sound = ::openfl::_legacy::Assets_obj::cache->getSound(id);		HX_STACK_VAR(sound,"sound");
			HX_STACK_LINE(466)
			if ((::openfl::_legacy::Assets_obj::isValidSound(sound))){
				HX_STACK_LINE(468)
				return sound;
			}
		}
		HX_STACK_LINE(474)
		int _g = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(474)
		::String libraryName = id.substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
		HX_STACK_LINE(475)
		int _g1 = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(475)
		int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(475)
		::String symbolName = id.substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
		HX_STACK_LINE(476)
		::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
		HX_STACK_LINE(478)
		if (((library != null()))){
			HX_STACK_LINE(480)
			if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::SOUND))){
				HX_STACK_LINE(482)
				if ((library->isLocal(symbolName,::openfl::_legacy::AssetType_obj::SOUND))){
					HX_STACK_LINE(484)
					::openfl::_legacy::media::Sound sound = library->getSound(symbolName);		HX_STACK_VAR(sound,"sound");
					HX_STACK_LINE(486)
					if (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))){
						HX_STACK_LINE(488)
						::openfl::_legacy::Assets_obj::cache->setSound(id,sound);
					}
					HX_STACK_LINE(492)
					return sound;
				}
				else{
					HX_STACK_LINE(496)
					::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] Sound asset \"") + id) + HX_CSTRING("\" exists, but only asynchronously")),hx::SourceInfo(HX_CSTRING("Assets.hx"),496,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getSound")));
				}
			}
			else{
				HX_STACK_LINE(502)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no Sound asset with an ID of \"") + id) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),502,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getSound")));
			}
		}
		else{
			HX_STACK_LINE(508)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),508,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getSound")));
		}
		HX_STACK_LINE(514)
		return null();
	}
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Assets_obj,getSound,return )

::String Assets_obj::getText( ::String id){
	HX_STACK_FRAME("openfl._legacy.Assets","getText",0xb863847c,"openfl._legacy.Assets.getText","openfl/_legacy/Assets.hx",525,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_LINE(527)
	::openfl::_legacy::Assets_obj::initialize();
	HX_STACK_LINE(531)
	int _g = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
	HX_STACK_LINE(531)
	::String libraryName = id.substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
	HX_STACK_LINE(532)
	int _g1 = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
	HX_STACK_LINE(532)
	int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
	HX_STACK_LINE(532)
	::String symbolName = id.substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
	HX_STACK_LINE(533)
	::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
	HX_STACK_LINE(535)
	if (((library != null()))){
		HX_STACK_LINE(537)
		if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::TEXT))){
			HX_STACK_LINE(539)
			if ((library->isLocal(symbolName,::openfl::_legacy::AssetType_obj::TEXT))){
				HX_STACK_LINE(541)
				return library->getText(symbolName);
			}
			else{
				HX_STACK_LINE(545)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] String asset \"") + id) + HX_CSTRING("\" exists, but only asynchronously")),hx::SourceInfo(HX_CSTRING("Assets.hx"),545,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getText")));
			}
		}
		else{
			HX_STACK_LINE(551)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no String asset with an ID of \"") + id) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),551,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getText")));
		}
	}
	else{
		HX_STACK_LINE(557)
		::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),557,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("getText")));
	}
	HX_STACK_LINE(563)
	return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Assets_obj,getText,return )

bool Assets_obj::hasEventListener( ::String type){
	HX_STACK_FRAME("openfl._legacy.Assets","hasEventListener",0xba27dbbb,"openfl._legacy.Assets.hasEventListener","openfl/_legacy/Assets.hx",568,0x9276b055)
	HX_STACK_ARG(type,"type")
	HX_STACK_LINE(570)
	::openfl::_legacy::Assets_obj::initialize();
	HX_STACK_LINE(572)
	return ::openfl::_legacy::Assets_obj::dispatcher->hasEventListener(type);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Assets_obj,hasEventListener,return )

Void Assets_obj::initialize( ){
{
		HX_STACK_FRAME("openfl._legacy.Assets","initialize",0xf86f7ed7,"openfl._legacy.Assets.initialize","openfl/_legacy/Assets.hx",579,0x9276b055)
		HX_STACK_LINE(579)
		if ((!(::openfl::_legacy::Assets_obj::initialized))){
			HX_STACK_LINE(583)
			::DefaultAssetLibrary _g = ::DefaultAssetLibrary_obj::__new();		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(583)
			::openfl::_legacy::Assets_obj::registerLibrary(HX_CSTRING("default"),_g);
			HX_STACK_LINE(587)
			::openfl::_legacy::Assets_obj::initialized = true;
		}
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Assets_obj,initialize,(void))

bool Assets_obj::isLocal( ::String id,::openfl::_legacy::AssetType type,hx::Null< bool >  __o_useCache){
bool useCache = __o_useCache.Default(true);
	HX_STACK_FRAME("openfl._legacy.Assets","isLocal",0xae5d753a,"openfl._legacy.Assets.isLocal","openfl/_legacy/Assets.hx",594,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_ARG(type,"type")
	HX_STACK_ARG(useCache,"useCache")
{
		HX_STACK_LINE(596)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(600)
		if (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))){
			HX_STACK_LINE(602)
			if (((bool((type == ::openfl::_legacy::AssetType_obj::IMAGE)) || bool((type == null()))))){
				HX_STACK_LINE(604)
				if ((::openfl::_legacy::Assets_obj::cache->hasBitmapData(id))){
					HX_STACK_LINE(604)
					return true;
				}
			}
			HX_STACK_LINE(608)
			if (((bool((type == ::openfl::_legacy::AssetType_obj::FONT)) || bool((type == null()))))){
				HX_STACK_LINE(610)
				if ((::openfl::_legacy::Assets_obj::cache->hasFont(id))){
					HX_STACK_LINE(610)
					return true;
				}
			}
			HX_STACK_LINE(614)
			if (((bool((bool((type == ::openfl::_legacy::AssetType_obj::SOUND)) || bool((type == ::openfl::_legacy::AssetType_obj::MUSIC)))) || bool((type == null()))))){
				HX_STACK_LINE(616)
				if ((::openfl::_legacy::Assets_obj::cache->hasSound(id))){
					HX_STACK_LINE(616)
					return true;
				}
			}
		}
		HX_STACK_LINE(622)
		int _g = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(622)
		::String libraryName = id.substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
		HX_STACK_LINE(623)
		int _g1 = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(623)
		int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(623)
		::String symbolName = id.substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
		HX_STACK_LINE(624)
		::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
		HX_STACK_LINE(626)
		if (((library != null()))){
			HX_STACK_LINE(628)
			return library->isLocal(symbolName,type);
		}
		HX_STACK_LINE(634)
		return false;
	}
}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(Assets_obj,isLocal,return )

bool Assets_obj::isValidBitmapData( ::openfl::_legacy::display::BitmapData bitmapData){
	HX_STACK_FRAME("openfl._legacy.Assets","isValidBitmapData",0xcf9de664,"openfl._legacy.Assets.isValidBitmapData","openfl/_legacy/Assets.hx",639,0x9276b055)
	HX_STACK_ARG(bitmapData,"bitmapData")
	HX_STACK_LINE(644)
	return (bitmapData->__handle != null());
	HX_STACK_LINE(665)
	return true;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Assets_obj,isValidBitmapData,return )

bool Assets_obj::isValidSound( ::openfl::_legacy::media::Sound sound){
	HX_STACK_FRAME("openfl._legacy.Assets","isValidSound",0x3cb31c04,"openfl._legacy.Assets.isValidSound","openfl/_legacy/Assets.hx",670,0x9276b055)
	HX_STACK_ARG(sound,"sound")
	HX_STACK_LINE(675)
	return (bool((sound->__handle != null())) && bool((sound->__handle != (int)0)));
	HX_STACK_LINE(680)
	return true;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Assets_obj,isValidSound,return )

Array< ::String > Assets_obj::list( ::openfl::_legacy::AssetType type){
	HX_STACK_FRAME("openfl._legacy.Assets","list",0x7c38faa5,"openfl._legacy.Assets.list","openfl/_legacy/Assets.hx",685,0x9276b055)
	HX_STACK_ARG(type,"type")
	HX_STACK_LINE(687)
	::openfl::_legacy::Assets_obj::initialize();
	HX_STACK_LINE(689)
	Array< ::String > items = Array_obj< ::String >::__new();		HX_STACK_VAR(items,"items");
	HX_STACK_LINE(691)
	for(::cpp::FastIterator_obj< ::openfl::_legacy::AssetLibrary > *__it = ::cpp::CreateFastIterator< ::openfl::_legacy::AssetLibrary >(::openfl::_legacy::Assets_obj::libraries->iterator());  __it->hasNext(); ){
		::openfl::_legacy::AssetLibrary library = __it->next();
		{
			HX_STACK_LINE(693)
			Array< ::String > libraryItems = library->list(type);		HX_STACK_VAR(libraryItems,"libraryItems");
			HX_STACK_LINE(695)
			if (((libraryItems != null()))){
				HX_STACK_LINE(697)
				Array< ::String > _g = items->concat(libraryItems);		HX_STACK_VAR(_g,"_g");
				HX_STACK_LINE(697)
				items = _g;
			}
		}
;
	}
	HX_STACK_LINE(703)
	return items;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Assets_obj,list,return )

Void Assets_obj::loadBitmapData( ::String id,Dynamic handler,hx::Null< bool >  __o_useCache){
bool useCache = __o_useCache.Default(true);
	HX_STACK_FRAME("openfl._legacy.Assets","loadBitmapData",0x55e8dc86,"openfl._legacy.Assets.loadBitmapData","openfl/_legacy/Assets.hx",708,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_ARG(handler,"handler")
	HX_STACK_ARG(useCache,"useCache")
{
		HX_STACK_LINE(708)
		Dynamic handler1 = Dynamic( Array_obj<Dynamic>::__new().Add(handler));		HX_STACK_VAR(handler1,"handler1");
		HX_STACK_LINE(708)
		Array< ::String > id1 = Array_obj< ::String >::__new().Add(id);		HX_STACK_VAR(id1,"id1");
		HX_STACK_LINE(710)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(714)
		if (((  (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))) ? bool(::openfl::_legacy::Assets_obj::cache->hasBitmapData(id1->__get((int)0))) : bool(false) ))){
			HX_STACK_LINE(716)
			::openfl::_legacy::display::BitmapData bitmapData = ::openfl::_legacy::Assets_obj::cache->getBitmapData(id1->__get((int)0));		HX_STACK_VAR(bitmapData,"bitmapData");
			HX_STACK_LINE(718)
			if ((::openfl::_legacy::Assets_obj::isValidBitmapData(bitmapData))){
				HX_STACK_LINE(720)
				handler1->__GetItem((int)0)(bitmapData).Cast< Void >();
				HX_STACK_LINE(721)
				return null();
			}
		}
		HX_STACK_LINE(727)
		int _g = id1->__get((int)0).indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(727)
		::String libraryName = id1->__get((int)0).substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
		HX_STACK_LINE(728)
		int _g1 = id1->__get((int)0).indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(728)
		int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(728)
		::String symbolName = id1->__get((int)0).substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
		HX_STACK_LINE(729)
		::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
		HX_STACK_LINE(731)
		if (((library != null()))){
			HX_STACK_LINE(733)
			if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::IMAGE))){
				HX_STACK_LINE(735)
				if (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))){

					HX_BEGIN_LOCAL_FUNC_S2(hx::LocalFunc,_Function_4_1,Dynamic,handler1,Array< ::String >,id1)
					Void run(::openfl::_legacy::display::BitmapData bitmapData){
						HX_STACK_FRAME("*","_Function_4_1",0x520333fa,"*._Function_4_1","openfl/_legacy/Assets.hx",737,0x9276b055)
						HX_STACK_ARG(bitmapData,"bitmapData")
						{
							HX_STACK_LINE(739)
							::openfl::_legacy::Assets_obj::cache->setBitmapData(id1->__get((int)0),bitmapData);
							HX_STACK_LINE(740)
							handler1->__GetItem((int)0)(bitmapData).Cast< Void >();
						}
						return null();
					}
					HX_END_LOCAL_FUNC1((void))

					HX_STACK_LINE(737)
					library->loadBitmapData(symbolName, Dynamic(new _Function_4_1(handler1,id1)));
				}
				else{
					HX_STACK_LINE(746)
					library->loadBitmapData(symbolName,handler1->__GetItem((int)0));
				}
				HX_STACK_LINE(750)
				return null();
			}
			else{
				HX_STACK_LINE(754)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no BitmapData asset with an ID of \"") + id1->__get((int)0)) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),754,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadBitmapData")));
			}
		}
		else{
			HX_STACK_LINE(760)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),760,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadBitmapData")));
		}
		HX_STACK_LINE(766)
		handler1->__GetItem((int)0)(null()).Cast< Void >();
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(Assets_obj,loadBitmapData,(void))

Void Assets_obj::loadBytes( ::String id,Dynamic handler){
{
		HX_STACK_FRAME("openfl._legacy.Assets","loadBytes",0xbf9b54be,"openfl._legacy.Assets.loadBytes","openfl/_legacy/Assets.hx",771,0x9276b055)
		HX_STACK_ARG(id,"id")
		HX_STACK_ARG(handler,"handler")
		HX_STACK_LINE(773)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(777)
		int _g = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(777)
		::String libraryName = id.substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
		HX_STACK_LINE(778)
		int _g1 = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(778)
		int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(778)
		::String symbolName = id.substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
		HX_STACK_LINE(779)
		::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
		HX_STACK_LINE(781)
		if (((library != null()))){
			HX_STACK_LINE(783)
			if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::BINARY))){
				HX_STACK_LINE(785)
				library->loadBytes(symbolName,handler);
				HX_STACK_LINE(786)
				return null();
			}
			else{
				HX_STACK_LINE(790)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no String or ByteArray asset with an ID of \"") + id) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),790,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadBytes")));
			}
		}
		else{
			HX_STACK_LINE(796)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),796,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadBytes")));
		}
		HX_STACK_LINE(802)
		handler(null()).Cast< Void >();
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Assets_obj,loadBytes,(void))

Void Assets_obj::loadFont( ::String id,Dynamic handler,hx::Null< bool >  __o_useCache){
bool useCache = __o_useCache.Default(true);
	HX_STACK_FRAME("openfl._legacy.Assets","loadFont",0xe5a03cdc,"openfl._legacy.Assets.loadFont","openfl/_legacy/Assets.hx",807,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_ARG(handler,"handler")
	HX_STACK_ARG(useCache,"useCache")
{
		HX_STACK_LINE(807)
		Dynamic handler1 = Dynamic( Array_obj<Dynamic>::__new().Add(handler));		HX_STACK_VAR(handler1,"handler1");
		HX_STACK_LINE(807)
		Array< ::String > id1 = Array_obj< ::String >::__new().Add(id);		HX_STACK_VAR(id1,"id1");
		HX_STACK_LINE(809)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(813)
		if (((  (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))) ? bool(::openfl::_legacy::Assets_obj::cache->hasFont(id1->__get((int)0))) : bool(false) ))){
			HX_STACK_LINE(815)
			::openfl::_legacy::text::Font _g = ::openfl::_legacy::Assets_obj::cache->getFont(id1->__get((int)0));		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(815)
			handler1->__GetItem((int)0)(_g).Cast< Void >();
			HX_STACK_LINE(816)
			return null();
		}
		HX_STACK_LINE(820)
		int _g1 = id1->__get((int)0).indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(820)
		::String libraryName = id1->__get((int)0).substring((int)0,_g1);		HX_STACK_VAR(libraryName,"libraryName");
		HX_STACK_LINE(821)
		int _g2 = id1->__get((int)0).indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(821)
		int _g3 = (_g2 + (int)1);		HX_STACK_VAR(_g3,"_g3");
		HX_STACK_LINE(821)
		::String symbolName = id1->__get((int)0).substr(_g3,null());		HX_STACK_VAR(symbolName,"symbolName");
		HX_STACK_LINE(822)
		::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
		HX_STACK_LINE(824)
		if (((library != null()))){
			HX_STACK_LINE(826)
			if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::FONT))){
				HX_STACK_LINE(828)
				if (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))){

					HX_BEGIN_LOCAL_FUNC_S2(hx::LocalFunc,_Function_4_1,Dynamic,handler1,Array< ::String >,id1)
					Void run(::openfl::_legacy::text::Font font){
						HX_STACK_FRAME("*","_Function_4_1",0x520333fa,"*._Function_4_1","openfl/_legacy/Assets.hx",830,0x9276b055)
						HX_STACK_ARG(font,"font")
						{
							HX_STACK_LINE(832)
							::openfl::_legacy::Assets_obj::cache->setFont(id1->__get((int)0),font);
							HX_STACK_LINE(833)
							handler1->__GetItem((int)0)(font).Cast< Void >();
						}
						return null();
					}
					HX_END_LOCAL_FUNC1((void))

					HX_STACK_LINE(830)
					library->loadFont(symbolName, Dynamic(new _Function_4_1(handler1,id1)));
				}
				else{
					HX_STACK_LINE(839)
					library->loadFont(symbolName,handler1->__GetItem((int)0));
				}
				HX_STACK_LINE(843)
				return null();
			}
			else{
				HX_STACK_LINE(847)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no Font asset with an ID of \"") + id1->__get((int)0)) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),847,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadFont")));
			}
		}
		else{
			HX_STACK_LINE(853)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),853,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadFont")));
		}
		HX_STACK_LINE(859)
		handler1->__GetItem((int)0)(null()).Cast< Void >();
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(Assets_obj,loadFont,(void))

Void Assets_obj::loadLibrary( ::String name,Dynamic handler){
{
		HX_STACK_FRAME("openfl._legacy.Assets","loadLibrary",0x421d6e0e,"openfl._legacy.Assets.loadLibrary","openfl/_legacy/Assets.hx",864,0x9276b055)
		HX_STACK_ARG(name,"name")
		HX_STACK_ARG(handler,"handler")
		HX_STACK_LINE(866)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(870)
		::String data = ::openfl::_legacy::Assets_obj::getText(((HX_CSTRING("libraries/") + name) + HX_CSTRING(".json")));		HX_STACK_VAR(data,"data");
		HX_STACK_LINE(872)
		if (((bool((data != null())) && bool((data != HX_CSTRING("")))))){
			HX_STACK_LINE(874)
			Dynamic info = ::haxe::format::JsonParser_obj::__new(data)->parseRec();		HX_STACK_VAR(info,"info");
			HX_STACK_LINE(875)
			::Class _g = ::Type_obj::resolveClass(info->__Field(HX_CSTRING("type"),true));		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(875)
			::openfl::_legacy::AssetLibrary library = ::Type_obj::createInstance(_g,info->__Field(HX_CSTRING("args"),true));		HX_STACK_VAR(library,"library");
			HX_STACK_LINE(876)
			::openfl::_legacy::Assets_obj::libraries->set(name,library);
			HX_STACK_LINE(877)
			library->eventCallback = ::openfl::_legacy::Assets_obj::library_onEvent_dyn();
			HX_STACK_LINE(878)
			library->load(handler);
		}
		else{
			HX_STACK_LINE(882)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + name) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),882,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadLibrary")));
		}
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Assets_obj,loadLibrary,(void))

Void Assets_obj::loadMusic( ::String id,Dynamic handler,hx::Null< bool >  __o_useCache){
bool useCache = __o_useCache.Default(true);
	HX_STACK_FRAME("openfl._legacy.Assets","loadMusic",0x125e1cf8,"openfl._legacy.Assets.loadMusic","openfl/_legacy/Assets.hx",891,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_ARG(handler,"handler")
	HX_STACK_ARG(useCache,"useCache")
{
		HX_STACK_LINE(891)
		Dynamic handler1 = Dynamic( Array_obj<Dynamic>::__new().Add(handler));		HX_STACK_VAR(handler1,"handler1");
		HX_STACK_LINE(891)
		Array< ::String > id1 = Array_obj< ::String >::__new().Add(id);		HX_STACK_VAR(id1,"id1");
		HX_STACK_LINE(893)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(897)
		if (((  (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))) ? bool(::openfl::_legacy::Assets_obj::cache->hasSound(id1->__get((int)0))) : bool(false) ))){
			HX_STACK_LINE(899)
			::openfl::_legacy::media::Sound sound = ::openfl::_legacy::Assets_obj::cache->getSound(id1->__get((int)0));		HX_STACK_VAR(sound,"sound");
			HX_STACK_LINE(901)
			if ((::openfl::_legacy::Assets_obj::isValidSound(sound))){
				HX_STACK_LINE(903)
				handler1->__GetItem((int)0)(sound).Cast< Void >();
				HX_STACK_LINE(904)
				return null();
			}
		}
		HX_STACK_LINE(910)
		int _g = id1->__get((int)0).indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(910)
		::String libraryName = id1->__get((int)0).substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
		HX_STACK_LINE(911)
		int _g1 = id1->__get((int)0).indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(911)
		int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(911)
		::String symbolName = id1->__get((int)0).substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
		HX_STACK_LINE(912)
		::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
		HX_STACK_LINE(914)
		if (((library != null()))){
			HX_STACK_LINE(916)
			if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::MUSIC))){
				HX_STACK_LINE(918)
				if (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))){

					HX_BEGIN_LOCAL_FUNC_S2(hx::LocalFunc,_Function_4_1,Dynamic,handler1,Array< ::String >,id1)
					Void run(::openfl::_legacy::media::Sound sound){
						HX_STACK_FRAME("*","_Function_4_1",0x520333fa,"*._Function_4_1","openfl/_legacy/Assets.hx",920,0x9276b055)
						HX_STACK_ARG(sound,"sound")
						{
							HX_STACK_LINE(922)
							::openfl::_legacy::Assets_obj::cache->setSound(id1->__get((int)0),sound);
							HX_STACK_LINE(923)
							handler1->__GetItem((int)0)(sound).Cast< Void >();
						}
						return null();
					}
					HX_END_LOCAL_FUNC1((void))

					HX_STACK_LINE(920)
					library->loadMusic(symbolName, Dynamic(new _Function_4_1(handler1,id1)));
				}
				else{
					HX_STACK_LINE(929)
					library->loadMusic(symbolName,handler1->__GetItem((int)0));
				}
				HX_STACK_LINE(933)
				return null();
			}
			else{
				HX_STACK_LINE(937)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no Sound asset with an ID of \"") + id1->__get((int)0)) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),937,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadMusic")));
			}
		}
		else{
			HX_STACK_LINE(943)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),943,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadMusic")));
		}
		HX_STACK_LINE(949)
		handler1->__GetItem((int)0)(null()).Cast< Void >();
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(Assets_obj,loadMusic,(void))

Void Assets_obj::loadMovieClip( ::String id,Dynamic handler){
{
		HX_STACK_FRAME("openfl._legacy.Assets","loadMovieClip",0x15f67473,"openfl._legacy.Assets.loadMovieClip","openfl/_legacy/Assets.hx",954,0x9276b055)
		HX_STACK_ARG(id,"id")
		HX_STACK_ARG(handler,"handler")
		HX_STACK_LINE(956)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(960)
		int _g = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(960)
		::String libraryName = id.substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
		HX_STACK_LINE(961)
		int _g1 = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(961)
		int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(961)
		::String symbolName = id.substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
		HX_STACK_LINE(962)
		::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
		HX_STACK_LINE(964)
		if (((library != null()))){
			HX_STACK_LINE(966)
			if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::MOVIE_CLIP))){
				HX_STACK_LINE(968)
				library->loadMovieClip(symbolName,handler);
				HX_STACK_LINE(969)
				return null();
			}
			else{
				HX_STACK_LINE(973)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no MovieClip asset with an ID of \"") + id) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),973,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadMovieClip")));
			}
		}
		else{
			HX_STACK_LINE(979)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),979,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadMovieClip")));
		}
		HX_STACK_LINE(985)
		handler(null()).Cast< Void >();
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Assets_obj,loadMovieClip,(void))

Void Assets_obj::loadSound( ::String id,Dynamic handler,hx::Null< bool >  __o_useCache){
bool useCache = __o_useCache.Default(true);
	HX_STACK_FRAME("openfl._legacy.Assets","loadSound",0x82cfd922,"openfl._legacy.Assets.loadSound","openfl/_legacy/Assets.hx",990,0x9276b055)
	HX_STACK_ARG(id,"id")
	HX_STACK_ARG(handler,"handler")
	HX_STACK_ARG(useCache,"useCache")
{
		HX_STACK_LINE(990)
		Dynamic handler1 = Dynamic( Array_obj<Dynamic>::__new().Add(handler));		HX_STACK_VAR(handler1,"handler1");
		HX_STACK_LINE(990)
		Array< ::String > id1 = Array_obj< ::String >::__new().Add(id);		HX_STACK_VAR(id1,"id1");
		HX_STACK_LINE(992)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(996)
		if (((  (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))) ? bool(::openfl::_legacy::Assets_obj::cache->hasSound(id1->__get((int)0))) : bool(false) ))){
			HX_STACK_LINE(998)
			::openfl::_legacy::media::Sound sound = ::openfl::_legacy::Assets_obj::cache->getSound(id1->__get((int)0));		HX_STACK_VAR(sound,"sound");
			HX_STACK_LINE(1000)
			if ((::openfl::_legacy::Assets_obj::isValidSound(sound))){
				HX_STACK_LINE(1002)
				handler1->__GetItem((int)0)(sound).Cast< Void >();
				HX_STACK_LINE(1003)
				return null();
			}
		}
		HX_STACK_LINE(1009)
		int _g = id1->__get((int)0).indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(1009)
		::String libraryName = id1->__get((int)0).substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
		HX_STACK_LINE(1010)
		int _g1 = id1->__get((int)0).indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(1010)
		int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(1010)
		::String symbolName = id1->__get((int)0).substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
		HX_STACK_LINE(1011)
		::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
		HX_STACK_LINE(1013)
		if (((library != null()))){
			HX_STACK_LINE(1015)
			if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::SOUND))){
				HX_STACK_LINE(1017)
				if (((  ((useCache)) ? bool(::openfl::_legacy::Assets_obj::cache->__Field(HX_CSTRING("get_enabled"),true)()) : bool(false) ))){

					HX_BEGIN_LOCAL_FUNC_S2(hx::LocalFunc,_Function_4_1,Dynamic,handler1,Array< ::String >,id1)
					Void run(::openfl::_legacy::media::Sound sound){
						HX_STACK_FRAME("*","_Function_4_1",0x520333fa,"*._Function_4_1","openfl/_legacy/Assets.hx",1019,0x9276b055)
						HX_STACK_ARG(sound,"sound")
						{
							HX_STACK_LINE(1021)
							::openfl::_legacy::Assets_obj::cache->setSound(id1->__get((int)0),sound);
							HX_STACK_LINE(1022)
							handler1->__GetItem((int)0)(sound).Cast< Void >();
						}
						return null();
					}
					HX_END_LOCAL_FUNC1((void))

					HX_STACK_LINE(1019)
					library->loadSound(symbolName, Dynamic(new _Function_4_1(handler1,id1)));
				}
				else{
					HX_STACK_LINE(1028)
					library->loadSound(symbolName,handler1->__GetItem((int)0));
				}
				HX_STACK_LINE(1032)
				return null();
			}
			else{
				HX_STACK_LINE(1036)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no Sound asset with an ID of \"") + id1->__get((int)0)) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),1036,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadSound")));
			}
		}
		else{
			HX_STACK_LINE(1042)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),1042,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadSound")));
		}
		HX_STACK_LINE(1048)
		handler1->__GetItem((int)0)(null()).Cast< Void >();
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(Assets_obj,loadSound,(void))

Void Assets_obj::loadText( ::String id,Dynamic handler){
{
		HX_STACK_FRAME("openfl._legacy.Assets","loadText",0xeed9abba,"openfl._legacy.Assets.loadText","openfl/_legacy/Assets.hx",1053,0x9276b055)
		HX_STACK_ARG(id,"id")
		HX_STACK_ARG(handler,"handler")
		HX_STACK_LINE(1055)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(1059)
		int _g = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(1059)
		::String libraryName = id.substring((int)0,_g);		HX_STACK_VAR(libraryName,"libraryName");
		HX_STACK_LINE(1060)
		int _g1 = id.indexOf(HX_CSTRING(":"),null());		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(1060)
		int _g2 = (_g1 + (int)1);		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(1060)
		::String symbolName = id.substr(_g2,null());		HX_STACK_VAR(symbolName,"symbolName");
		HX_STACK_LINE(1061)
		::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::getLibrary(libraryName);		HX_STACK_VAR(library,"library");
		HX_STACK_LINE(1063)
		if (((library != null()))){
			HX_STACK_LINE(1065)
			if ((library->exists(symbolName,::openfl::_legacy::AssetType_obj::TEXT))){
				HX_STACK_LINE(1067)
				library->loadText(symbolName,handler);
				HX_STACK_LINE(1068)
				return null();
			}
			else{
				HX_STACK_LINE(1072)
				::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no String asset with an ID of \"") + id) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),1072,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadText")));
			}
		}
		else{
			HX_STACK_LINE(1078)
			::haxe::Log_obj::trace(((HX_CSTRING("[openfl.Assets] There is no asset library named \"") + libraryName) + HX_CSTRING("\"")),hx::SourceInfo(HX_CSTRING("Assets.hx"),1078,HX_CSTRING("openfl._legacy.Assets"),HX_CSTRING("loadText")));
		}
		HX_STACK_LINE(1084)
		handler(null()).Cast< Void >();
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Assets_obj,loadText,(void))

Void Assets_obj::registerLibrary( ::String name,::openfl::_legacy::AssetLibrary library){
{
		HX_STACK_FRAME("openfl._legacy.Assets","registerLibrary",0x6f46d3f1,"openfl._legacy.Assets.registerLibrary","openfl/_legacy/Assets.hx",1089,0x9276b055)
		HX_STACK_ARG(name,"name")
		HX_STACK_ARG(library,"library")
		HX_STACK_LINE(1091)
		if ((::openfl::_legacy::Assets_obj::libraries->exists(name))){
			HX_STACK_LINE(1093)
			::openfl::_legacy::Assets_obj::unloadLibrary(name);
		}
		HX_STACK_LINE(1097)
		if (((library != null()))){
			HX_STACK_LINE(1099)
			library->eventCallback = ::openfl::_legacy::Assets_obj::library_onEvent_dyn();
		}
		HX_STACK_LINE(1103)
		::openfl::_legacy::Assets_obj::libraries->set(name,library);
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Assets_obj,registerLibrary,(void))

Void Assets_obj::removeEventListener( ::String type,Dynamic listener,hx::Null< bool >  __o_capture){
bool capture = __o_capture.Default(false);
	HX_STACK_FRAME("openfl._legacy.Assets","removeEventListener",0x0094d163,"openfl._legacy.Assets.removeEventListener","openfl/_legacy/Assets.hx",1108,0x9276b055)
	HX_STACK_ARG(type,"type")
	HX_STACK_ARG(listener,"listener")
	HX_STACK_ARG(capture,"capture")
{
		HX_STACK_LINE(1110)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(1112)
		::openfl::_legacy::Assets_obj::dispatcher->removeEventListener(type,listener,capture);
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(Assets_obj,removeEventListener,(void))

::Class Assets_obj::resolveClass( ::String name){
	HX_STACK_FRAME("openfl._legacy.Assets","resolveClass",0x1c65baf3,"openfl._legacy.Assets.resolveClass","openfl/_legacy/Assets.hx",1119,0x9276b055)
	HX_STACK_ARG(name,"name")
	HX_STACK_LINE(1119)
	return ::Type_obj::resolveClass(name);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Assets_obj,resolveClass,return )

::Enum Assets_obj::resolveEnum( ::String name){
	HX_STACK_FRAME("openfl._legacy.Assets","resolveEnum",0x106118a6,"openfl._legacy.Assets.resolveEnum","openfl/_legacy/Assets.hx",1124,0x9276b055)
	HX_STACK_ARG(name,"name")
	HX_STACK_LINE(1126)
	::Enum value = ::Type_obj::resolveEnum(name);		HX_STACK_VAR(value,"value");
	HX_STACK_LINE(1138)
	return value;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Assets_obj,resolveEnum,return )

Void Assets_obj::unloadLibrary( ::String name){
{
		HX_STACK_FRAME("openfl._legacy.Assets","unloadLibrary",0xacbdfc95,"openfl._legacy.Assets.unloadLibrary","openfl/_legacy/Assets.hx",1143,0x9276b055)
		HX_STACK_ARG(name,"name")
		HX_STACK_LINE(1145)
		::openfl::_legacy::Assets_obj::initialize();
		HX_STACK_LINE(1149)
		::openfl::_legacy::AssetLibrary library = ::openfl::_legacy::Assets_obj::libraries->get(name);		HX_STACK_VAR(library,"library");
		HX_STACK_LINE(1151)
		if (((library != null()))){
			HX_STACK_LINE(1153)
			::openfl::_legacy::Assets_obj::cache->clear((name + HX_CSTRING(":")));
			HX_STACK_LINE(1154)
			library->eventCallback = null();
		}
		HX_STACK_LINE(1158)
		::openfl::_legacy::Assets_obj::libraries->remove(name);
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Assets_obj,unloadLibrary,(void))

Void Assets_obj::library_onEvent( ::openfl::_legacy::AssetLibrary library,::String type){
{
		HX_STACK_FRAME("openfl._legacy.Assets","library_onEvent",0x9a352310,"openfl._legacy.Assets.library_onEvent","openfl/_legacy/Assets.hx",1174,0x9276b055)
		HX_STACK_ARG(library,"library")
		HX_STACK_ARG(type,"type")
		HX_STACK_LINE(1174)
		if (((type == HX_CSTRING("change")))){
			HX_STACK_LINE(1176)
			::openfl::_legacy::Assets_obj::cache->clear(null());
			HX_STACK_LINE(1177)
			::openfl::_legacy::events::Event _g = ::openfl::_legacy::events::Event_obj::__new(::openfl::_legacy::events::Event_obj::CHANGE,null(),null());		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(1177)
			::openfl::_legacy::Assets_obj::dispatchEvent(_g);
		}
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Assets_obj,library_onEvent,(void))


Assets_obj::Assets_obj()
{
}

Dynamic Assets_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"list") ) { return list_dyn(); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"cache") ) { return cache; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"exists") ) { return exists_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"getFont") ) { return getFont_dyn(); }
		if (HX_FIELD_EQ(inName,"getPath") ) { return getPath_dyn(); }
		if (HX_FIELD_EQ(inName,"getText") ) { return getText_dyn(); }
		if (HX_FIELD_EQ(inName,"isLocal") ) { return isLocal_dyn(); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"getBytes") ) { return getBytes_dyn(); }
		if (HX_FIELD_EQ(inName,"getMusic") ) { return getMusic_dyn(); }
		if (HX_FIELD_EQ(inName,"getSound") ) { return getSound_dyn(); }
		if (HX_FIELD_EQ(inName,"loadFont") ) { return loadFont_dyn(); }
		if (HX_FIELD_EQ(inName,"loadText") ) { return loadText_dyn(); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"libraries") ) { return libraries; }
		if (HX_FIELD_EQ(inName,"loadBytes") ) { return loadBytes_dyn(); }
		if (HX_FIELD_EQ(inName,"loadMusic") ) { return loadMusic_dyn(); }
		if (HX_FIELD_EQ(inName,"loadSound") ) { return loadSound_dyn(); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"dispatcher") ) { return dispatcher; }
		if (HX_FIELD_EQ(inName,"getLibrary") ) { return getLibrary_dyn(); }
		if (HX_FIELD_EQ(inName,"initialize") ) { return initialize_dyn(); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"initialized") ) { return initialized; }
		if (HX_FIELD_EQ(inName,"loadLibrary") ) { return loadLibrary_dyn(); }
		if (HX_FIELD_EQ(inName,"resolveEnum") ) { return resolveEnum_dyn(); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"getMovieClip") ) { return getMovieClip_dyn(); }
		if (HX_FIELD_EQ(inName,"isValidSound") ) { return isValidSound_dyn(); }
		if (HX_FIELD_EQ(inName,"resolveClass") ) { return resolveClass_dyn(); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"dispatchEvent") ) { return dispatchEvent_dyn(); }
		if (HX_FIELD_EQ(inName,"getBitmapData") ) { return getBitmapData_dyn(); }
		if (HX_FIELD_EQ(inName,"loadMovieClip") ) { return loadMovieClip_dyn(); }
		if (HX_FIELD_EQ(inName,"unloadLibrary") ) { return unloadLibrary_dyn(); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"loadBitmapData") ) { return loadBitmapData_dyn(); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"registerLibrary") ) { return registerLibrary_dyn(); }
		if (HX_FIELD_EQ(inName,"library_onEvent") ) { return library_onEvent_dyn(); }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"addEventListener") ) { return addEventListener_dyn(); }
		if (HX_FIELD_EQ(inName,"hasEventListener") ) { return hasEventListener_dyn(); }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"isValidBitmapData") ) { return isValidBitmapData_dyn(); }
		break;
	case 19:
		if (HX_FIELD_EQ(inName,"removeEventListener") ) { return removeEventListener_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Assets_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"cache") ) { cache=inValue.Cast< ::openfl::_legacy::IAssetCache >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"libraries") ) { libraries=inValue.Cast< ::haxe::ds::StringMap >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"dispatcher") ) { dispatcher=inValue.Cast< ::openfl::_legacy::events::EventDispatcher >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"initialized") ) { initialized=inValue.Cast< bool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Assets_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("cache"),
	HX_CSTRING("libraries"),
	HX_CSTRING("dispatcher"),
	HX_CSTRING("initialized"),
	HX_CSTRING("addEventListener"),
	HX_CSTRING("dispatchEvent"),
	HX_CSTRING("exists"),
	HX_CSTRING("getBitmapData"),
	HX_CSTRING("getBytes"),
	HX_CSTRING("getFont"),
	HX_CSTRING("getLibrary"),
	HX_CSTRING("getMovieClip"),
	HX_CSTRING("getMusic"),
	HX_CSTRING("getPath"),
	HX_CSTRING("getSound"),
	HX_CSTRING("getText"),
	HX_CSTRING("hasEventListener"),
	HX_CSTRING("initialize"),
	HX_CSTRING("isLocal"),
	HX_CSTRING("isValidBitmapData"),
	HX_CSTRING("isValidSound"),
	HX_CSTRING("list"),
	HX_CSTRING("loadBitmapData"),
	HX_CSTRING("loadBytes"),
	HX_CSTRING("loadFont"),
	HX_CSTRING("loadLibrary"),
	HX_CSTRING("loadMusic"),
	HX_CSTRING("loadMovieClip"),
	HX_CSTRING("loadSound"),
	HX_CSTRING("loadText"),
	HX_CSTRING("registerLibrary"),
	HX_CSTRING("removeEventListener"),
	HX_CSTRING("resolveClass"),
	HX_CSTRING("resolveEnum"),
	HX_CSTRING("unloadLibrary"),
	HX_CSTRING("library_onEvent"),
	String(null()) };

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *sMemberStorageInfo = 0;
#endif

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Assets_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(Assets_obj::cache,"cache");
	HX_MARK_MEMBER_NAME(Assets_obj::libraries,"libraries");
	HX_MARK_MEMBER_NAME(Assets_obj::dispatcher,"dispatcher");
	HX_MARK_MEMBER_NAME(Assets_obj::initialized,"initialized");
};

#ifdef HXCPP_VISIT_ALLOCS
static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Assets_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Assets_obj::cache,"cache");
	HX_VISIT_MEMBER_NAME(Assets_obj::libraries,"libraries");
	HX_VISIT_MEMBER_NAME(Assets_obj::dispatcher,"dispatcher");
	HX_VISIT_MEMBER_NAME(Assets_obj::initialized,"initialized");
};

#endif

Class Assets_obj::__mClass;

void Assets_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("openfl._legacy.Assets"), hx::TCanCast< Assets_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics
#ifdef HXCPP_VISIT_ALLOCS
    , sVisitStatics
#endif
#ifdef HXCPP_SCRIPTABLE
    , sMemberStorageInfo
#endif
);
}

void Assets_obj::__boot()
{
	cache= ::openfl::_legacy::AssetCache_obj::__new();
	libraries= ::haxe::ds::StringMap_obj::__new();
	dispatcher= ::openfl::_legacy::events::EventDispatcher_obj::__new(null());
	initialized= false;
}

} // end namespace openfl
} // end namespace _legacy
