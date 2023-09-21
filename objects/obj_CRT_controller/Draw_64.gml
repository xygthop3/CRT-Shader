///Ensure GUI layer is the correct size, same as the application surface.
//display_set_gui_size(surface_width, surface_height);
display_set_gui_size(surface_width, surface_height);

///Check if the CRT shader is enabled and apply the effect to the application surface.
if (crt_shader_enabled) { scr_CRT_appy_to_surface(application_surface, view_camera[0]); }	
  else draw_surface(application_surface, 0,0);

///Set the cameras position if it has been moved with the arrow keys.
///Just for demonstration purposes, can be removed.
camera_set_view_pos(view_camera[0], _xx, _yy);

///Alter CRT variables and enable/disable settings.
///Just for demonstration purposes, can be removed.
/// re-enable the arrow keys if you want to try moving the view around, trust me. The shader works with views.
/*
if (keyboard_check(vk_left))           { _xx -= 0.5; }
if (keyboard_check(vk_right))          { _xx += 0.5; }
if (keyboard_check(vk_up))             { _yy -= 0.5; }
if (keyboard_check(vk_down))           { _yy += 0.5; }
*/

if (keyboard_check_released(vk_space)) { crt_gui_bezel_enabled = !crt_gui_bezel_enabled; }
if (keyboard_check(vk_escape))		   { game_end(); }
if (keyboard_check_released(ord("A"))) { var_use_noise = !var_use_noise; }
if (keyboard_check_released(ord("B"))) { var_use_border = !var_use_border; }
if (keyboard_check_released(ord("D"))) { crt_shader_enabled = !crt_shader_enabled; }
if (keyboard_check_released(ord("E"))) { alarm[0]=1; alarm[1]=1; } //Play the on or off animation
if (keyboard_check_released(ord("F"))) { var_use_radial_distortion = !var_use_radial_distortion; }
if (keyboard_check(ord("G")))		   { var_noise_strength -= 0.01;}
if (keyboard_check(ord("H")))		   { var_brightness -= 0.01;}
if (keyboard_check_released(ord("Q"))) { var_use_scanlines = !var_use_scanlines; }
if (keyboard_check_released(ord("R"))) { var_use_RGB_separation = !var_use_RGB_separation; }
if (keyboard_check(ord("S")))		   { var_radial_distortion_ammount += 0.005;}
if (keyboard_check(ord("T")))		   { var_noise_strength += 0.01;}
if (keyboard_check(ord("W")))          { var_radial_distortion_ammount -= 0.005;} 
if (keyboard_check(ord("Y")))		   { var_brightness += 0.01;}

///Reset GUI layer back to the window size so we can draw text, etc.
display_set_gui_size(window_get_width(), window_get_height());
display_set_gui_maximise();

///Variable for enabling/disabling the CRT GUI bezel overlay.
///Just for demonstration purposes, can be removed.
if (crt_gui_bezel_enabled) { draw_sprite_stretched(spr_CRT_nes_bezel, -1, 0, 0, window_get_width(), window_get_height()); }

///Draw some text with the demo variables we're using.
///Just for demonstration purposes, can be removed.
draw_rectangle_color(0,0, 450, 148, c_black,c_black,c_black,c_black, false);
draw_text(2,12, "CRT shader enabled = " +	  string(crt_shader_enabled) +            " press D to change");
draw_text(2,24, "Distortion enabled = " +     string(var_use_radial_distortion) +	  " press F to change");
draw_text(2,36, "Distortion amount = " +      string(var_radial_distortion_ammount) + " press W/S to change");
draw_text(2,48, "Border enabled = " +         string(var_use_border) +                " press B to change");
draw_text(2,60, "RGB separation enabled = " + string(var_use_RGB_separation) +        " press R to change");
draw_text(2,72, "Scanlines enabled = " +      string(var_use_scanlines) +             " press Q to change");
draw_text(2,84, "CRT on/off state = " +       string(_crt_on_off_state) +             " press E to change");
draw_text(2,96, "Noise enabled = " +          string(var_use_noise) +				  " press A to change");
draw_text(2,108,"Random noise strength = " +  string(var_noise_strength) +			  " press T,G to change");
draw_text(2,120,"Brightness = " +			  string(var_brightness) +				  " press Y,H to change");
draw_text(2,132,"GUI bezel enabled = " +	  string(crt_gui_bezel_enabled) +		  " press SPACE to change");
