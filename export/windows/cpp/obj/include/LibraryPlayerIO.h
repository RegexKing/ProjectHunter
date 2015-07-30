#ifndef INCLUDED_LibraryPlayerIO
#define INCLUDED_LibraryPlayerIO

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <openfl/_legacy/utils/ByteArray.h>
HX_DECLARE_CLASS0(LibraryPlayerIO)
HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS3(openfl,_legacy,utils,ByteArray)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IDataInput)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IDataOutput)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IMemoryRange)


class HXCPP_CLASS_ATTRIBUTES  LibraryPlayerIO_obj : public ::openfl::_legacy::utils::ByteArray_obj{
	public:
		typedef ::openfl::_legacy::utils::ByteArray_obj super;
		typedef LibraryPlayerIO_obj OBJ_;
		LibraryPlayerIO_obj();
		Void __construct(Dynamic __o_size);

	public:
		inline void *operator new( size_t inSize, bool inContainer=true)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< LibraryPlayerIO_obj > __new(Dynamic __o_size);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~LibraryPlayerIO_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		::String __ToString() const { return HX_CSTRING("LibraryPlayerIO"); }

		static ::String resourceName;
};


#endif /* INCLUDED_LibraryPlayerIO */ 
