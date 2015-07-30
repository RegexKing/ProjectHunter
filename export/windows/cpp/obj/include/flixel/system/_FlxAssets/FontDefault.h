#ifndef INCLUDED_flixel_system__FlxAssets_FontDefault
#define INCLUDED_flixel_system__FlxAssets_FontDefault

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <openfl/_legacy/text/Font.h>
HX_DECLARE_CLASS3(flixel,system,_FlxAssets,FontDefault)
HX_DECLARE_CLASS3(openfl,_legacy,text,Font)
HX_DECLARE_CLASS3(openfl,_legacy,text,FontStyle)
HX_DECLARE_CLASS3(openfl,_legacy,text,FontType)
namespace flixel{
namespace system{
namespace _FlxAssets{


class HXCPP_CLASS_ATTRIBUTES  FontDefault_obj : public ::openfl::_legacy::text::Font_obj{
	public:
		typedef ::openfl::_legacy::text::Font_obj super;
		typedef FontDefault_obj OBJ_;
		FontDefault_obj();
		Void __construct(::String __o_filename,::openfl::_legacy::text::FontStyle style,::openfl::_legacy::text::FontType type);

	public:
		inline void *operator new( size_t inSize, bool inContainer=true)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< FontDefault_obj > __new(::String __o_filename,::openfl::_legacy::text::FontStyle style,::openfl::_legacy::text::FontType type);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~FontDefault_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		::String __ToString() const { return HX_CSTRING("FontDefault"); }

		static ::String resourceName;
};

} // end namespace flixel
} // end namespace system
} // end namespace _FlxAssets

#endif /* INCLUDED_flixel_system__FlxAssets_FontDefault */ 
