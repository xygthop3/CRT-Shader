draw_set_color(c_white);
//show_debug_overlay(true);

///MUST!!! disable automatic drawing of the application surface.
///It will be manually drawn too in the Draw GUI event with the CRT shader applied.
///If you're drawing everything to your own surface then this should already be disbaled.
application_surface_draw_enable(false);

///Setting up the cameras view of the world.
/*
Common retro console resolutions

3rd Gen
Atari 7800 = 160×200 or 320×200
NES = 256×224 or 256×240 
Mater System = 256×192, 256×224, 256×240 

4th Gen
TurboGrafx-16 = 256×224 to 565×242 (progressive), 256×448 to 565×484 (interlaced)
SNES = 256×224 to 256×239 (progressive), 512×448 to 512×478 (interlaced)
Mega Drive/Genesis = 256×224 to 320×240 (progressive), 320×448 to 320×480 (interlaced)

5th Gen
PlayStation = 256×224 to 640×240 (progressive), 256×448 to 640×480 (interlaced)
Nintendo 64 = 320×240 to 720×288 (progressive), 320×480 to 720×576 (interlaced)
*/
view_camera[0] = camera_create();
camera_set_view_size(view_camera[0], 640, 480); //See common resolution sizes above.

/*
RECOMMENDED CAMERA AND VIEW SETTING (not mandatory)
To avoid "moire pattern" when using radial distortion and scaling the image.

If you're using a low resolution camera,
set the viewport to be 2x or 3x the camera view size (when practical).

Keep same aspect ratio as camera view eg: 4:3 or 16:9 etc.

Trying to scale from 4:3 camera to 16:9 view, will work however, results may not be ideal.

Same when going full screen. Even if you setup everything here as 4:3, if you change to
full screen and the monitor is eg: 16:9 then the distortion and RGB separation will look strange.
*/
view_visible[0] = true;
view_enabled = true;
view_wport[0] = 1024;
view_hport[0] = 768;
window_set_size(view_wport[0], view_hport[0]);
window_set_position(10,40)

///_xx and _yy variables are used to move the views position around.
///Just for demonstration purposes, can be removed.
_xx = 0;
_yy = 0;

///Variable for enabling/disabling the CRT effect.
///Just for demonstration purposes, can be removed.
crt_shader_enabled = true;

///Variable for enabling/disabling the CRT GUI bezel overlay. Only usefull in 16:9 ratio, otherwise it covers the game window.
///Just for demonstration purposes, can be removed.
crt_gui_bezel_enabled = false;

///Setup the CRT shaders variables and shader uniforms
scr_CRT_init_shader(view_camera[0], true, 0.12, true, true, true, 0.03, 80.0, 1.0, false, 0.175);