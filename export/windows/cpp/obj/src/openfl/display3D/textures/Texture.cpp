#include <hxcpp.h>

#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_openfl__legacy_display_BitmapData
#include <openfl/_legacy/display/BitmapData.h>
#endif
#ifndef INCLUDED_openfl__legacy_display_IBitmapDrawable
#include <openfl/_legacy/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl__legacy_events_EventDispatcher
#include <openfl/_legacy/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl__legacy_events_IEventDispatcher
#include <openfl/_legacy/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_openfl__legacy_geom_Point
#include <openfl/_legacy/geom/Point.h>
#endif
#ifndef INCLUDED_openfl__legacy_geom_Rectangle
#include <openfl/_legacy/geom/Rectangle.h>
#endif
#ifndef INCLUDED_openfl__legacy_gl_GL
#include <openfl/_legacy/gl/GL.h>
#endif
#ifndef INCLUDED_openfl__legacy_gl_GLObject
#include <openfl/_legacy/gl/GLObject.h>
#endif
#ifndef INCLUDED_openfl__legacy_gl_GLTexture
#include <openfl/_legacy/gl/GLTexture.h>
#endif
#ifndef INCLUDED_openfl__legacy_utils_ArrayBufferView
#include <openfl/_legacy/utils/ArrayBufferView.h>
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
#ifndef INCLUDED_openfl__legacy_utils_UInt8Array
#include <openfl/_legacy/utils/UInt8Array.h>
#endif
#ifndef INCLUDED_openfl_display3D_textures_Texture
#include <openfl/display3D/textures/Texture.h>
#endif
#ifndef INCLUDED_openfl_display3D_textures_TextureBase
#include <openfl/display3D/textures/TextureBase.h>
#endif
namespace openfl{
namespace display3D{
namespace textures{

Void Texture_obj::__construct(::openfl::_legacy::gl::GLTexture glTexture,bool optimize,int width,int height)
{
HX_STACK_FRAME("openfl.display3D.textures.Texture","new",0xaee720f0,"openfl.display3D.textures.Texture.new","openfl/display3D/textures/Texture.hx",21,0x3ee19dbf)
HX_STACK_THIS(this)
HX_STACK_ARG(glTexture,"glTexture")
HX_STACK_ARG(optimize,"optimize")
HX_STACK_ARG(width,"width")
HX_STACK_ARG(height,"height")
{
	HX_STACK_LINE(23)
	this->optimizeForRenderToTexture = optimize;
	HX_STACK_LINE(29)
	super::__construct(glTexture,width,height);
	HX_STACK_LINE(32)
	if ((this->optimizeForRenderToTexture)){
		HX_STACK_LINE(34)
		::openfl::_legacy::gl::GL_obj::lime_gl_pixel_storei((int)37440,(int)1);
		HX_STACK_LINE(35)
		::openfl::_legacy::gl::GL_obj::lime_gl_tex_parameteri((int)3553,(int)10240,(int)9728);
		HX_STACK_LINE(36)
		::openfl::_legacy::gl::GL_obj::lime_gl_tex_parameteri((int)3553,(int)10241,(int)9728);
		HX_STACK_LINE(37)
		::openfl::_legacy::gl::GL_obj::lime_gl_tex_parameteri((int)3553,(int)10242,(int)33071);
		HX_STACK_LINE(38)
		::openfl::_legacy::gl::GL_obj::lime_gl_tex_parameteri((int)3553,(int)10243,(int)33071);
	}
}
;
	return null();
}

//Texture_obj::~Texture_obj() { }

Dynamic Texture_obj::__CreateEmpty() { return  new Texture_obj; }
hx::ObjectPtr< Texture_obj > Texture_obj::__new(::openfl::_legacy::gl::GLTexture glTexture,bool optimize,int width,int height)
{  hx::ObjectPtr< Texture_obj > result = new Texture_obj();
	result->__construct(glTexture,optimize,width,height);
	return result;}

Dynamic Texture_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Texture_obj > result = new Texture_obj();
	result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3]);
	return result;}

Void Texture_obj::uploadCompressedTextureFromByteArray( ::openfl::_legacy::utils::ByteArray data,int byteArrayOffset,hx::Null< bool >  __o_async){
bool async = __o_async.Default(false);
	HX_STACK_FRAME("openfl.display3D.textures.Texture","uploadCompressedTextureFromByteArray",0xe2c5b53e,"openfl.display3D.textures.Texture.uploadCompressedTextureFromByteArray","openfl/display3D/textures/Texture.hx",46,0x3ee19dbf)
	HX_STACK_THIS(this)
	HX_STACK_ARG(data,"data")
	HX_STACK_ARG(byteArrayOffset,"byteArrayOffset")
	HX_STACK_ARG(async,"async")
{
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC3(Texture_obj,uploadCompressedTextureFromByteArray,(void))

Void Texture_obj::uploadFromBitmapData( ::openfl::_legacy::display::BitmapData bitmapData,hx::Null< int >  __o_miplevel){
int miplevel = __o_miplevel.Default(0);
	HX_STACK_FRAME("openfl.display3D.textures.Texture","uploadFromBitmapData",0x5c4e9314,"openfl.display3D.textures.Texture.uploadFromBitmapData","openfl/display3D/textures/Texture.hx",53,0x3ee19dbf)
	HX_STACK_THIS(this)
	HX_STACK_ARG(bitmapData,"bitmapData")
	HX_STACK_ARG(miplevel,"miplevel")
{
		HX_STACK_LINE(57)
		::openfl::_legacy::utils::ByteArray pixels;		HX_STACK_VAR(pixels,"pixels");
		HX_STACK_LINE(57)
		{
			HX_STACK_LINE(57)
			int _g = bitmapData->get_width();		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(57)
			int _g1 = bitmapData->get_height();		HX_STACK_VAR(_g1,"_g1");
			HX_STACK_LINE(57)
			bool _g2 = bitmapData->get_transparent();		HX_STACK_VAR(_g2,"_g2");
			HX_STACK_LINE(57)
			::openfl::_legacy::display::BitmapData rgbaData = ::openfl::_legacy::display::BitmapData_obj::__new(_g,_g1,_g2,null(),null());		HX_STACK_VAR(rgbaData,"rgbaData");
			HX_STACK_LINE(57)
			::openfl::_legacy::geom::Rectangle rect = bitmapData->get_rect();		HX_STACK_VAR(rect,"rect");
			HX_STACK_LINE(57)
			::openfl::_legacy::geom::Point point = ::openfl::_legacy::geom::Point_obj::__new((int)0,(int)0);		HX_STACK_VAR(point,"point");
			HX_STACK_LINE(57)
			rgbaData->copyChannel(bitmapData,rect,point,(int)2,(int)1);
			HX_STACK_LINE(57)
			rgbaData->copyChannel(bitmapData,rect,point,(int)4,(int)2);
			HX_STACK_LINE(57)
			rgbaData->copyChannel(bitmapData,rect,point,(int)8,(int)4);
			HX_STACK_LINE(57)
			rgbaData->copyChannel(bitmapData,rect,point,(int)1,(int)8);
			HX_STACK_LINE(57)
			pixels = rgbaData->getPixels(rect);
		}
		HX_STACK_LINE(59)
		int _g3 = bitmapData->get_width();		HX_STACK_VAR(_g3,"_g3");
		HX_STACK_LINE(59)
		this->width = _g3;
		HX_STACK_LINE(60)
		int _g4 = bitmapData->get_height();		HX_STACK_VAR(_g4,"_g4");
		HX_STACK_LINE(60)
		this->height = _g4;
		HX_STACK_LINE(62)
		this->uploadFromByteArray(pixels,(int)0,miplevel);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC2(Texture_obj,uploadFromBitmapData,(void))

Void Texture_obj::uploadFromByteArray( ::openfl::_legacy::utils::ByteArray data,int byteArrayOffset,hx::Null< int >  __o_miplevel){
int miplevel = __o_miplevel.Default(0);
	HX_STACK_FRAME("openfl.display3D.textures.Texture","uploadFromByteArray",0x0d748876,"openfl.display3D.textures.Texture.uploadFromByteArray","openfl/display3D/textures/Texture.hx",85,0x3ee19dbf)
	HX_STACK_THIS(this)
	HX_STACK_ARG(data,"data")
	HX_STACK_ARG(byteArrayOffset,"byteArrayOffset")
	HX_STACK_ARG(miplevel,"miplevel")
{
		HX_STACK_LINE(100)
		::openfl::_legacy::utils::UInt8Array source = ::openfl::_legacy::utils::UInt8Array_obj::__new(data,null(),null());		HX_STACK_VAR(source,"source");
		HX_STACK_LINE(103)
		this->uploadFromUInt8Array(source,miplevel);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC3(Texture_obj,uploadFromByteArray,(void))

Void Texture_obj::uploadFromUInt8Array( ::openfl::_legacy::utils::UInt8Array data,hx::Null< int >  __o_miplevel){
int miplevel = __o_miplevel.Default(0);
	HX_STACK_FRAME("openfl.display3D.textures.Texture","uploadFromUInt8Array",0xb98d8296,"openfl.display3D.textures.Texture.uploadFromUInt8Array","openfl/display3D/textures/Texture.hx",108,0x3ee19dbf)
	HX_STACK_THIS(this)
	HX_STACK_ARG(data,"data")
	HX_STACK_ARG(miplevel,"miplevel")
{
		HX_STACK_LINE(110)
		{
			HX_STACK_LINE(110)
			::openfl::_legacy::gl::GLTexture texture = this->glTexture;		HX_STACK_VAR(texture,"texture");
			HX_STACK_LINE(110)
			::openfl::_legacy::gl::GL_obj::lime_gl_bind_texture((int)3553,(  (((texture == null()))) ? Dynamic(null()) : Dynamic(texture->id) ));
		}
		HX_STACK_LINE(112)
		if ((this->optimizeForRenderToTexture)){
			HX_STACK_LINE(114)
			::openfl::_legacy::gl::GL_obj::lime_gl_pixel_storei((int)37440,(int)1);
			HX_STACK_LINE(115)
			::openfl::_legacy::gl::GL_obj::lime_gl_tex_parameteri((int)3553,(int)10240,(int)9728);
			HX_STACK_LINE(116)
			::openfl::_legacy::gl::GL_obj::lime_gl_tex_parameteri((int)3553,(int)10241,(int)9728);
			HX_STACK_LINE(117)
			::openfl::_legacy::gl::GL_obj::lime_gl_tex_parameteri((int)3553,(int)10242,(int)33071);
			HX_STACK_LINE(118)
			::openfl::_legacy::gl::GL_obj::lime_gl_tex_parameteri((int)3553,(int)10243,(int)33071);
		}
		HX_STACK_LINE(122)
		{
			HX_STACK_LINE(122)
			::openfl::_legacy::utils::ByteArray _g;		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(122)
			if (((data == null()))){
				HX_STACK_LINE(122)
				_g = null();
			}
			else{
				HX_STACK_LINE(122)
				_g = data->getByteBuffer();
			}
			HX_STACK_LINE(122)
			Dynamic _g1;		HX_STACK_VAR(_g1,"_g1");
			HX_STACK_LINE(122)
			if (((data == null()))){
				HX_STACK_LINE(122)
				_g1 = null();
			}
			else{
				HX_STACK_LINE(122)
				_g1 = data->getStart();
			}
			HX_STACK_LINE(122)
			::openfl::_legacy::gl::GL_obj::lime_gl_tex_image_2d((int)3553,miplevel,(int)6408,this->width,this->height,(int)0,(int)6408,(int)5121,_g,_g1);
		}
		HX_STACK_LINE(123)
		::openfl::_legacy::gl::GL_obj::lime_gl_bind_texture((int)3553,null());
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC2(Texture_obj,uploadFromUInt8Array,(void))


Texture_obj::Texture_obj()
{
}

Dynamic Texture_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 19:
		if (HX_FIELD_EQ(inName,"uploadFromByteArray") ) { return uploadFromByteArray_dyn(); }
		break;
	case 20:
		if (HX_FIELD_EQ(inName,"uploadFromBitmapData") ) { return uploadFromBitmapData_dyn(); }
		if (HX_FIELD_EQ(inName,"uploadFromUInt8Array") ) { return uploadFromUInt8Array_dyn(); }
		break;
	case 26:
		if (HX_FIELD_EQ(inName,"optimizeForRenderToTexture") ) { return optimizeForRenderToTexture; }
		break;
	case 36:
		if (HX_FIELD_EQ(inName,"uploadCompressedTextureFromByteArray") ) { return uploadCompressedTextureFromByteArray_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Texture_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 26:
		if (HX_FIELD_EQ(inName,"optimizeForRenderToTexture") ) { optimizeForRenderToTexture=inValue.Cast< bool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Texture_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("optimizeForRenderToTexture"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

#if HXCPP_SCRIPTABLE
static hx::StorageInfo sMemberStorageInfo[] = {
	{hx::fsBool,(int)offsetof(Texture_obj,optimizeForRenderToTexture),HX_CSTRING("optimizeForRenderToTexture")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String sMemberFields[] = {
	HX_CSTRING("optimizeForRenderToTexture"),
	HX_CSTRING("uploadCompressedTextureFromByteArray"),
	HX_CSTRING("uploadFromBitmapData"),
	HX_CSTRING("uploadFromByteArray"),
	HX_CSTRING("uploadFromUInt8Array"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Texture_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Texture_obj::__mClass,"__mClass");
};

#endif

Class Texture_obj::__mClass;

void Texture_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("openfl.display3D.textures.Texture"), hx::TCanCast< Texture_obj> ,sStaticFields,sMemberFields,
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

void Texture_obj::__boot()
{
}

} // end namespace openfl
} // end namespace display3D
} // end namespace textures
