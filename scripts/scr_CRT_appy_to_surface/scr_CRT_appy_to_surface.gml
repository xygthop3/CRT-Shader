/// @func scr_CRT_appy_to_surface(Surface, Camera);
/// @desc 
/// @param surfID 
/// @param cameraID 
function scr_CRT_appy_to_surface(argument0, argument1) {

	_crt_surf = argument0;
	_crt_camera = argument1;

	var_brightness = clamp(var_brightness, 0, 2);
	var_radial_distortion_ammount = clamp(var_radial_distortion_ammount, -2, 2);
	var_noise_strength = clamp(var_noise_strength, 0, 1);

	shader_set(shd_CRT_Shader);
	  shader_set_uniform_f(uni_crt_sizes,                surface_width, surface_height, crt_surface_width, crt_surface_height);
	  shader_set_uniform_f(uni_radial_distortion_amount, var_radial_distortion_ammount);  
	  shader_set_uniform_f(uni_use_radial_distortion,    var_use_radial_distortion);
	  shader_set_uniform_f(uni_use_border,               var_use_border);
	  shader_set_uniform_f(uni_use_RGB_separation,       var_use_RGB_separation);
	  shader_set_uniform_f(uni_use_scanlines,            var_use_scanlines);
	  shader_set_uniform_f(uni_border_corner_size,       var_border_corner_size);
	  shader_set_uniform_f(uni_border_corner_smoothness, var_border_corner_smoothness);
	  shader_set_uniform_f(uni_brightness,				 var_brightness);
	  shader_set_uniform_f(uni_use_noise,				 var_use_noise);
	  shader_set_uniform_f(uni_noise_strength,			 var_noise_strength);
	  shader_set_uniform_f(uni_timer, get_timer());

	  draw_surface_stretched(_crt_surf, 0, 0, camera_get_view_width(_crt_camera), camera_get_view_height(_crt_camera) );
	shader_reset();


}
