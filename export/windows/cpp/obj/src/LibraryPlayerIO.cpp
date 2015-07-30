#include <hxcpp.h>

#ifndef INCLUDED_LibraryPlayerIO
#include <LibraryPlayerIO.h>
#endif
#ifndef INCLUDED_haxe_Resource
#include <haxe/Resource.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
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

Void LibraryPlayerIO_obj::__construct(Dynamic __o_size)
{
HX_STACK_FRAME("LibraryPlayerIO","new",0x5709ed74,"LibraryPlayerIO.new","openfl/_legacy/Assets.hx",1829,0x9276b055)
HX_STACK_THIS(this)
HX_STACK_ARG(__o_size,"size")
Dynamic size = __o_size.Default(0);
{
	HX_STACK_LINE(1831)
	super::__construct(null());
	HX_STACK_LINE(1836)
	{
		HX_STACK_LINE(1836)
		::haxe::io::Bytes bytes = ::haxe::Resource_obj::getBytes(::LibraryPlayerIO_obj::resourceName);		HX_STACK_VAR(bytes,"bytes");
		HX_STACK_LINE(1836)
		this->b = bytes->b;
		HX_STACK_LINE(1836)
		this->length = bytes->length;
	}
}
;
	return null();
}

//LibraryPlayerIO_obj::~LibraryPlayerIO_obj() { }

Dynamic LibraryPlayerIO_obj::__CreateEmpty() { return  new LibraryPlayerIO_obj; }
hx::ObjectPtr< LibraryPlayerIO_obj > LibraryPlayerIO_obj::__new(Dynamic __o_size)
{  hx::ObjectPtr< LibraryPlayerIO_obj > result = new LibraryPlayerIO_obj();
	result->__construct(__o_size);
	return result;}

Dynamic LibraryPlayerIO_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< LibraryPlayerIO_obj > result = new LibraryPlayerIO_obj();
	result->__construct(inArgs[0]);
	return result;}

::String LibraryPlayerIO_obj::resourceName;


LibraryPlayerIO_obj::LibraryPlayerIO_obj()
{
}

Dynamic LibraryPlayerIO_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 12:
		if (HX_FIELD_EQ(inName,"resourceName") ) { return resourceName; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic LibraryPlayerIO_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 12:
		if (HX_FIELD_EQ(inName,"resourceName") ) { resourceName=inValue.Cast< ::String >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void LibraryPlayerIO_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("resourceName"),
	String(null()) };

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *sMemberStorageInfo = 0;
#endif

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(LibraryPlayerIO_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(LibraryPlayerIO_obj::resourceName,"resourceName");
};

#ifdef HXCPP_VISIT_ALLOCS
static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(LibraryPlayerIO_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(LibraryPlayerIO_obj::resourceName,"resourceName");
};

#endif

Class LibraryPlayerIO_obj::__mClass;

void LibraryPlayerIO_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("LibraryPlayerIO"), hx::TCanCast< LibraryPlayerIO_obj> ,sStaticFields,sMemberFields,
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

void LibraryPlayerIO_obj::__boot()
{
	resourceName= HX_CSTRING("__ASSET__:file_LibraryPlayerIO");
}

