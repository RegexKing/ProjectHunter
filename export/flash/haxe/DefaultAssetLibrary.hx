package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/data/Chiffon & Bows.ttf", __ASSET__assets_data_chiffon___bows_ttf);
		type.set ("assets/data/Chiffon & Bows.ttf", AssetType.FONT);
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/fonts/BRITANIC.TTF", __ASSET__assets_fonts_britanic_ttf);
		type.set ("assets/fonts/BRITANIC.TTF", AssetType.FONT);
		className.set ("assets/fonts/ChiffonBows.ttf", __ASSET__assets_fonts_chiffonbows_ttf);
		type.set ("assets/fonts/ChiffonBows.ttf", AssetType.FONT);
		className.set ("assets/images/archer1.png", __ASSET__assets_images_archer1_png);
		type.set ("assets/images/archer1.png", AssetType.IMAGE);
		className.set ("assets/images/archer2.png", __ASSET__assets_images_archer2_png);
		type.set ("assets/images/archer2.png", AssetType.IMAGE);
		className.set ("assets/images/arrow.png", __ASSET__assets_images_arrow_png);
		type.set ("assets/images/arrow.png", AssetType.IMAGE);
		className.set ("assets/images/bg_1.png", __ASSET__assets_images_bg_1_png);
		type.set ("assets/images/bg_1.png", AssetType.IMAGE);
		className.set ("assets/images/bg_2.png", __ASSET__assets_images_bg_2_png);
		type.set ("assets/images/bg_2.png", AssetType.IMAGE);
		className.set ("assets/images/blood.png", __ASSET__assets_images_blood_png);
		type.set ("assets/images/blood.png", AssetType.IMAGE);
		className.set ("assets/images/button.png", __ASSET__assets_images_button_png);
		type.set ("assets/images/button.png", AssetType.IMAGE);
		className.set ("assets/images/chiffon_logo.png", __ASSET__assets_images_chiffon_logo_png);
		type.set ("assets/images/chiffon_logo.png", AssetType.IMAGE);
		className.set ("assets/images/dirArrow.png", __ASSET__assets_images_dirarrow_png);
		type.set ("assets/images/dirArrow.png", AssetType.IMAGE);
		className.set ("assets/images/go.png", __ASSET__assets_images_go_png);
		type.set ("assets/images/go.png", AssetType.IMAGE);
		className.set ("assets/images/gradient.png", __ASSET__assets_images_gradient_png);
		type.set ("assets/images/gradient.png", AssetType.IMAGE);
		className.set ("assets/images/highlight.png", __ASSET__assets_images_highlight_png);
		type.set ("assets/images/highlight.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/middleground.png", __ASSET__assets_images_middleground_png);
		type.set ("assets/images/middleground.png", AssetType.IMAGE);
		className.set ("assets/images/middleplus.png", __ASSET__assets_images_middleplus_png);
		type.set ("assets/images/middleplus.png", AssetType.IMAGE);
		className.set ("assets/images/mtn.png", __ASSET__assets_images_mtn_png);
		type.set ("assets/images/mtn.png", AssetType.IMAGE);
		className.set ("assets/images/sky.png", __ASSET__assets_images_sky_png);
		type.set ("assets/images/sky.png", AssetType.IMAGE);
		className.set ("assets/images/stop.png", __ASSET__assets_images_stop_png);
		type.set ("assets/images/stop.png", AssetType.IMAGE);
		className.set ("assets/images/title.png", __ASSET__assets_images_title_png);
		type.set ("assets/images/title.png", AssetType.IMAGE);
		className.set ("assets/images/turn_arrow.png", __ASSET__assets_images_turn_arrow_png);
		type.set ("assets/images/turn_arrow.png", AssetType.IMAGE);
		className.set ("assets/libraryng.swf", __ASSET__assets_libraryng_swf);
		type.set ("assets/libraryng.swf", AssetType.TEXT);
		className.set ("assets/librarypio.swf", __ASSET__assets_librarypio_swf);
		type.set ("assets/librarypio.swf", AssetType.TEXT);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/music/woodland_loop.mp3", __ASSET__assets_music_woodland_loop_mp3);
		type.set ("assets/music/woodland_loop.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/arrowgrnd.mp3", __ASSET__assets_sounds_arrowgrnd_mp3);
		type.set ("assets/sounds/arrowgrnd.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/arrowHit1.mp3", __ASSET__assets_sounds_arrowhit1_mp3);
		type.set ("assets/sounds/arrowHit1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/arrowHit2.mp3", __ASSET__assets_sounds_arrowhit2_mp3);
		type.set ("assets/sounds/arrowHit2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/arrowHit3.mp3", __ASSET__assets_sounds_arrowhit3_mp3);
		type.set ("assets/sounds/arrowHit3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/arrowHit4.mp3", __ASSET__assets_sounds_arrowhit4_mp3);
		type.set ("assets/sounds/arrowHit4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/arrowHit5.mp3", __ASSET__assets_sounds_arrowhit5_mp3);
		type.set ("assets/sounds/arrowHit5.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/arrowHit6.mp3", __ASSET__assets_sounds_arrowhit6_mp3);
		type.set ("assets/sounds/arrowHit6.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/arrowHit7.mp3", __ASSET__assets_sounds_arrowhit7_mp3);
		type.set ("assets/sounds/arrowHit7.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/arrowHit8.mp3", __ASSET__assets_sounds_arrowhit8_mp3);
		type.set ("assets/sounds/arrowHit8.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/femHurt1.mp3", __ASSET__assets_sounds_femhurt1_mp3);
		type.set ("assets/sounds/femHurt1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/femHurt2.mp3", __ASSET__assets_sounds_femhurt2_mp3);
		type.set ("assets/sounds/femHurt2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/femHurt3.mp3", __ASSET__assets_sounds_femhurt3_mp3);
		type.set ("assets/sounds/femHurt3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/headshot.mp3", __ASSET__assets_sounds_headshot_mp3);
		type.set ("assets/sounds/headshot.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/maleHurt1.mp3", __ASSET__assets_sounds_malehurt1_mp3);
		type.set ("assets/sounds/maleHurt1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/maleHurt2.mp3", __ASSET__assets_sounds_malehurt2_mp3);
		type.set ("assets/sounds/maleHurt2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/maleHurt3.mp3", __ASSET__assets_sounds_malehurt3_mp3);
		type.set ("assets/sounds/maleHurt3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", AssetType.TEXT);
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", AssetType.TEXT);
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", AssetType.TEXT);
		className.set ("ChiffonBows", __ASSET__assets_fonts_chiffonbows_ttf1);
		type.set ("ChiffonBows", AssetType.FONT);
		className.set ("Britannic Bold", __ASSET__assets_fonts_britanic_ttf1);
		type.set ("Britannic Bold", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/Chiffon & Bows.ttf";
		className.set (id, __ASSET__assets_data_chiffon___bows_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/fonts/BRITANIC.TTF";
		className.set (id, __ASSET__assets_fonts_britanic_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/ChiffonBows.ttf";
		className.set (id, __ASSET__assets_fonts_chiffonbows_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/images/archer1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/archer2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bg_1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bg_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blood.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/chiffon_logo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dirArrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/go.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/gradient.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/highlight.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/middleground.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/middleplus.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mtn.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sky.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/stop.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/turn_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/libraryng.swf";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/librarypio.swf";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/woodland_loop.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/arrowgrnd.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/arrowHit1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/arrowHit2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/arrowHit3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/arrowHit4.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/arrowHit5.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/arrowHit6.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/arrowHit7.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/arrowHit8.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/femHurt1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/femHurt2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/femHurt3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/headshot.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/maleHurt1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/maleHurt2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/maleHurt3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/flixel-ui/img/box.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_thin.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_toggle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/check_box.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/check_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_flat.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_inset.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_light.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/dropdown_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/finger_big.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/finger_small.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/hilight.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/invis.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/minus_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/plus_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/radio.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/radio_dot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/swatch.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tab.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tab_back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/xml/defaults.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/flixel-ui/xml/default_loading_screen.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/flixel-ui/xml/default_popup.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "ChiffonBows";
		className.set (id, __ASSET__assets_fonts_chiffonbows_ttf1);
		
		type.set (id, AssetType.FONT);
		id = "Britannic Bold";
		className.set (id, __ASSET__assets_fonts_britanic_ttf1);
		
		type.set (id, AssetType.FONT);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_data_chiffon___bows_ttf);
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_britanic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_chiffonbows_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_chiffonbows_ttf1);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_britanic_ttf1);
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/Chiffon & Bows.ttf", __ASSET__assets_data_chiffon___bows_ttf);
		type.set ("assets/data/Chiffon & Bows.ttf", AssetType.FONT);
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/fonts/BRITANIC.TTF", __ASSET__assets_fonts_britanic_ttf);
		type.set ("assets/fonts/BRITANIC.TTF", AssetType.FONT);
		
		className.set ("assets/fonts/ChiffonBows.ttf", __ASSET__assets_fonts_chiffonbows_ttf);
		type.set ("assets/fonts/ChiffonBows.ttf", AssetType.FONT);
		
		className.set ("assets/images/archer1.png", __ASSET__assets_images_archer1_png);
		type.set ("assets/images/archer1.png", AssetType.IMAGE);
		
		className.set ("assets/images/archer2.png", __ASSET__assets_images_archer2_png);
		type.set ("assets/images/archer2.png", AssetType.IMAGE);
		
		className.set ("assets/images/arrow.png", __ASSET__assets_images_arrow_png);
		type.set ("assets/images/arrow.png", AssetType.IMAGE);
		
		className.set ("assets/images/bg_1.png", __ASSET__assets_images_bg_1_png);
		type.set ("assets/images/bg_1.png", AssetType.IMAGE);
		
		className.set ("assets/images/bg_2.png", __ASSET__assets_images_bg_2_png);
		type.set ("assets/images/bg_2.png", AssetType.IMAGE);
		
		className.set ("assets/images/blood.png", __ASSET__assets_images_blood_png);
		type.set ("assets/images/blood.png", AssetType.IMAGE);
		
		className.set ("assets/images/button.png", __ASSET__assets_images_button_png);
		type.set ("assets/images/button.png", AssetType.IMAGE);
		
		className.set ("assets/images/chiffon_logo.png", __ASSET__assets_images_chiffon_logo_png);
		type.set ("assets/images/chiffon_logo.png", AssetType.IMAGE);
		
		className.set ("assets/images/dirArrow.png", __ASSET__assets_images_dirarrow_png);
		type.set ("assets/images/dirArrow.png", AssetType.IMAGE);
		
		className.set ("assets/images/go.png", __ASSET__assets_images_go_png);
		type.set ("assets/images/go.png", AssetType.IMAGE);
		
		className.set ("assets/images/gradient.png", __ASSET__assets_images_gradient_png);
		type.set ("assets/images/gradient.png", AssetType.IMAGE);
		
		className.set ("assets/images/highlight.png", __ASSET__assets_images_highlight_png);
		type.set ("assets/images/highlight.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/middleground.png", __ASSET__assets_images_middleground_png);
		type.set ("assets/images/middleground.png", AssetType.IMAGE);
		
		className.set ("assets/images/middleplus.png", __ASSET__assets_images_middleplus_png);
		type.set ("assets/images/middleplus.png", AssetType.IMAGE);
		
		className.set ("assets/images/mtn.png", __ASSET__assets_images_mtn_png);
		type.set ("assets/images/mtn.png", AssetType.IMAGE);
		
		className.set ("assets/images/sky.png", __ASSET__assets_images_sky_png);
		type.set ("assets/images/sky.png", AssetType.IMAGE);
		
		className.set ("assets/images/stop.png", __ASSET__assets_images_stop_png);
		type.set ("assets/images/stop.png", AssetType.IMAGE);
		
		className.set ("assets/images/title.png", __ASSET__assets_images_title_png);
		type.set ("assets/images/title.png", AssetType.IMAGE);
		
		className.set ("assets/images/turn_arrow.png", __ASSET__assets_images_turn_arrow_png);
		type.set ("assets/images/turn_arrow.png", AssetType.IMAGE);
		
		className.set ("assets/libraryng.swf", __ASSET__assets_libraryng_swf);
		type.set ("assets/libraryng.swf", AssetType.TEXT);
		
		className.set ("assets/librarypio.swf", __ASSET__assets_librarypio_swf);
		type.set ("assets/librarypio.swf", AssetType.TEXT);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/music/woodland_loop.mp3", __ASSET__assets_music_woodland_loop_mp3);
		type.set ("assets/music/woodland_loop.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/arrowgrnd.mp3", __ASSET__assets_sounds_arrowgrnd_mp3);
		type.set ("assets/sounds/arrowgrnd.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/arrowHit1.mp3", __ASSET__assets_sounds_arrowhit1_mp3);
		type.set ("assets/sounds/arrowHit1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/arrowHit2.mp3", __ASSET__assets_sounds_arrowhit2_mp3);
		type.set ("assets/sounds/arrowHit2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/arrowHit3.mp3", __ASSET__assets_sounds_arrowhit3_mp3);
		type.set ("assets/sounds/arrowHit3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/arrowHit4.mp3", __ASSET__assets_sounds_arrowhit4_mp3);
		type.set ("assets/sounds/arrowHit4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/arrowHit5.mp3", __ASSET__assets_sounds_arrowhit5_mp3);
		type.set ("assets/sounds/arrowHit5.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/arrowHit6.mp3", __ASSET__assets_sounds_arrowhit6_mp3);
		type.set ("assets/sounds/arrowHit6.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/arrowHit7.mp3", __ASSET__assets_sounds_arrowhit7_mp3);
		type.set ("assets/sounds/arrowHit7.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/arrowHit8.mp3", __ASSET__assets_sounds_arrowhit8_mp3);
		type.set ("assets/sounds/arrowHit8.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/femHurt1.mp3", __ASSET__assets_sounds_femhurt1_mp3);
		type.set ("assets/sounds/femHurt1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/femHurt2.mp3", __ASSET__assets_sounds_femhurt2_mp3);
		type.set ("assets/sounds/femHurt2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/femHurt3.mp3", __ASSET__assets_sounds_femhurt3_mp3);
		type.set ("assets/sounds/femHurt3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/headshot.mp3", __ASSET__assets_sounds_headshot_mp3);
		type.set ("assets/sounds/headshot.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/maleHurt1.mp3", __ASSET__assets_sounds_malehurt1_mp3);
		type.set ("assets/sounds/maleHurt1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/maleHurt2.mp3", __ASSET__assets_sounds_malehurt2_mp3);
		type.set ("assets/sounds/maleHurt2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/maleHurt3.mp3", __ASSET__assets_sounds_malehurt3_mp3);
		type.set ("assets/sounds/maleHurt3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", AssetType.TEXT);
		
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", AssetType.TEXT);
		
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", AssetType.TEXT);
		
		className.set ("ChiffonBows", __ASSET__assets_fonts_chiffonbows_ttf1);
		type.set ("ChiffonBows", AssetType.FONT);
		
		className.set ("Britannic Bold", __ASSET__assets_fonts_britanic_ttf1);
		type.set ("Britannic Bold", AssetType.FONT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			handler (getAudioBuffer (id));
			
		}
		#else
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_chiffon___bows_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_britanic_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_chiffonbows_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_images_archer1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_archer2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blood_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_chiffon_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dirarrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_go_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_gradient_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_highlight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_middleground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_middleplus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mtn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_stop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_turn_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_libraryng_swf extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_librarypio_swf extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_woodland_loop_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arrowgrnd_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arrowhit1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arrowhit2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arrowhit3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arrowhit4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arrowhit5_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arrowhit6_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arrowhit7_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arrowhit8_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_femhurt1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_femhurt2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_femhurt3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_headshot_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_malehurt1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_malehurt2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_malehurt3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_chiffonbows_ttf1 extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_britanic_ttf1 extends flash.text.Font { }


#elseif html5

@:keep #if display private #end class __ASSET__assets_data_chiffon___bows_ttf extends lime.text.Font { public function new () { super (); name = "ChiffonBows"; } } 

@:keep #if display private #end class __ASSET__assets_fonts_britanic_ttf extends lime.text.Font { public function new () { super (); name = "Britannic Bold"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_chiffonbows_ttf extends lime.text.Font { public function new () { super (); name = "ChiffonBows"; } } 








































































@:keep #if display private #end class __ASSET__assets_fonts_chiffonbows_ttf1 extends lime.text.Font { public function new () { super (); name = "ChiffonBows"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_britanic_ttf1 extends lime.text.Font { public function new () { super (); name = "Britannic Bold"; } } 


#else



#if (windows || mac || linux)


@:font("assets/data/Chiffon & Bows.ttf") #if display private #end class __ASSET__assets_data_chiffon___bows_ttf extends lime.text.Font {}
@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.ByteArray {}
@:font("assets/fonts/BRITANIC.TTF") #if display private #end class __ASSET__assets_fonts_britanic_ttf extends lime.text.Font {}
@:font("assets/fonts/ChiffonBows.ttf") #if display private #end class __ASSET__assets_fonts_chiffonbows_ttf extends lime.text.Font {}
@:image("assets/images/archer1.png") #if display private #end class __ASSET__assets_images_archer1_png extends lime.graphics.Image {}
@:image("assets/images/archer2.png") #if display private #end class __ASSET__assets_images_archer2_png extends lime.graphics.Image {}
@:image("assets/images/arrow.png") #if display private #end class __ASSET__assets_images_arrow_png extends lime.graphics.Image {}
@:image("assets/images/bg_1.png") #if display private #end class __ASSET__assets_images_bg_1_png extends lime.graphics.Image {}
@:image("assets/images/bg_2.png") #if display private #end class __ASSET__assets_images_bg_2_png extends lime.graphics.Image {}
@:image("assets/images/blood.png") #if display private #end class __ASSET__assets_images_blood_png extends lime.graphics.Image {}
@:image("assets/images/button.png") #if display private #end class __ASSET__assets_images_button_png extends lime.graphics.Image {}
@:image("assets/images/chiffon_logo.png") #if display private #end class __ASSET__assets_images_chiffon_logo_png extends lime.graphics.Image {}
@:image("assets/images/dirArrow.png") #if display private #end class __ASSET__assets_images_dirarrow_png extends lime.graphics.Image {}
@:image("assets/images/go.png") #if display private #end class __ASSET__assets_images_go_png extends lime.graphics.Image {}
@:image("assets/images/gradient.png") #if display private #end class __ASSET__assets_images_gradient_png extends lime.graphics.Image {}
@:image("assets/images/highlight.png") #if display private #end class __ASSET__assets_images_highlight_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.ByteArray {}
@:image("assets/images/middleground.png") #if display private #end class __ASSET__assets_images_middleground_png extends lime.graphics.Image {}
@:image("assets/images/middleplus.png") #if display private #end class __ASSET__assets_images_middleplus_png extends lime.graphics.Image {}
@:image("assets/images/mtn.png") #if display private #end class __ASSET__assets_images_mtn_png extends lime.graphics.Image {}
@:image("assets/images/sky.png") #if display private #end class __ASSET__assets_images_sky_png extends lime.graphics.Image {}
@:image("assets/images/stop.png") #if display private #end class __ASSET__assets_images_stop_png extends lime.graphics.Image {}
@:image("assets/images/title.png") #if display private #end class __ASSET__assets_images_title_png extends lime.graphics.Image {}
@:image("assets/images/turn_arrow.png") #if display private #end class __ASSET__assets_images_turn_arrow_png extends lime.graphics.Image {}
@:file("assets/libraryng.swf") #if display private #end class __ASSET__assets_libraryng_swf extends lime.utils.ByteArray {}
@:file("assets/librarypio.swf") #if display private #end class __ASSET__assets_librarypio_swf extends lime.utils.ByteArray {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/music/woodland_loop.mp3") #if display private #end class __ASSET__assets_music_woodland_loop_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/arrowgrnd.mp3") #if display private #end class __ASSET__assets_sounds_arrowgrnd_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/arrowHit1.mp3") #if display private #end class __ASSET__assets_sounds_arrowhit1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/arrowHit2.mp3") #if display private #end class __ASSET__assets_sounds_arrowhit2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/arrowHit3.mp3") #if display private #end class __ASSET__assets_sounds_arrowhit3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/arrowHit4.mp3") #if display private #end class __ASSET__assets_sounds_arrowhit4_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/arrowHit5.mp3") #if display private #end class __ASSET__assets_sounds_arrowhit5_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/arrowHit6.mp3") #if display private #end class __ASSET__assets_sounds_arrowhit6_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/arrowHit7.mp3") #if display private #end class __ASSET__assets_sounds_arrowhit7_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/arrowHit8.mp3") #if display private #end class __ASSET__assets_sounds_arrowhit8_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/femHurt1.mp3") #if display private #end class __ASSET__assets_sounds_femhurt1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/femHurt2.mp3") #if display private #end class __ASSET__assets_sounds_femhurt2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/femHurt3.mp3") #if display private #end class __ASSET__assets_sounds_femhurt3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/headshot.mp3") #if display private #end class __ASSET__assets_sounds_headshot_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/maleHurt1.mp3") #if display private #end class __ASSET__assets_sounds_malehurt1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/maleHurt2.mp3") #if display private #end class __ASSET__assets_sounds_malehurt2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/maleHurt3.mp3") #if display private #end class __ASSET__assets_sounds_malehurt3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,8/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,8/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/box.png") #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button_arrow_down.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button_arrow_left.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button_arrow_right.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button_arrow_up.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button_thin.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button_toggle.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/check_box.png") #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/check_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/chrome.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/chrome_flat.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/chrome_inset.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/chrome_light.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/dropdown_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/finger_big.png") #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/finger_small.png") #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/hilight.png") #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/invis.png") #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/minus_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/plus_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/radio.png") #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/radio_dot.png") #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/swatch.png") #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/tab.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/tab_back.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/xml/defaults.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/xml/default_loading_screen.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/xml/default_popup.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends lime.utils.ByteArray {}
@:font("assets/fonts/ChiffonBows.ttf") #if display private #end class __ASSET__assets_fonts_chiffonbows_ttf1 extends lime.text.Font {}
@:font("assets/fonts/BRITANIC.TTF") #if display private #end class __ASSET__assets_fonts_britanic_ttf1 extends lime.text.Font {}



#end

#if openfl
@:keep #if display private #end class __ASSET__OPENFL__assets_data_chiffon___bows_ttf extends openfl.text.Font { public function new () { __fontPath = "assets/data/Chiffon & Bows.ttf"; name = "ChiffonBows"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_britanic_ttf extends openfl.text.Font { public function new () { __fontPath = "assets/fonts/BRITANIC.TTF"; name = "Britannic Bold"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_chiffonbows_ttf extends openfl.text.Font { public function new () { __fontPath = "assets/fonts/ChiffonBows.ttf"; name = "ChiffonBows"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_chiffonbows_ttf1 extends openfl.text.Font { public function new () { __fontPath = "assets/fonts/ChiffonBows.ttf"; name = "ChiffonBows"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_britanic_ttf1 extends openfl.text.Font { public function new () { __fontPath = "assets/fonts/BRITANIC.TTF"; name = "Britannic Bold"; super (); }}

#end

#end
#end

