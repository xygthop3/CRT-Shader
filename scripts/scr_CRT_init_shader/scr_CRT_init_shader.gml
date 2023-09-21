/// @func scr_CRT_init_shader(Camera, RadEnable, DistAmount, BorderEnable, RGBEnable);
/// @desc Sets up the shader variables & uniforms. Resizes the application surface to current view port width and height
/// @param {real} Camera Specify camera view (view_camera)
/// @param {bool} RadEnable Enable radial distortion
/// @param {real} DistAmount Radial Distortion amount. Range is (-2.0 - 2.0)  the lower the camera view size, means there are less pixel there are on the screen, so use less distortion. Default = 0.12
/// @param {bool} BorderEnable Enable radial distortion
/// @param {bool} RGBEnable Enable RGB separation
/// @param {bool} ScanEnable Enable Scanlines
/// @param {float} CornerSize The size of the border corner. Range is (0.0 - 1.0) Lower = smaller corners. Default = 0.3
/// @param {float} CornerSmooth The falloff of the border corner.  Range is (10.0 - 200.0) Lower = longer falloff. Default = 80.0
/// @param {float} Brightness The amount of brightness. Range is (0.0 - 2.0) Default = 1.0
/// @param {bool} UseNoise Enable texture noise
/// @param {float} NoiseStrength Noise strength ammount. Range is (0.0 - 1.0) Lower = noise is less visible. Default = 0.2
function scr_CRT_init_shader(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {

	_crt_camera =                   argument0;
	var_use_radial_distortion =     argument1;
	var_radial_distortion_ammount = argument2;
	var_use_border =                argument3;
	var_use_RGB_separation =        argument4;
	var_use_scanlines =             argument5;
	var_border_corner_size =	    argument6;
	var_border_corner_smoothness =  argument7;
	var_brightness =				argument8;
	var_use_noise = 				argument9;
	var_noise_strength =     		argument10;

	crt_surface_width  =            view_get_wport(view_current);
	crt_surface_height =            view_get_hport(view_current);

	uni_crt_sizes =                 shader_get_uniform(shd_CRT_Shader, "uni_crt_sizes");
	uni_radial_distortion_amount =  shader_get_uniform(shd_CRT_Shader, "uni_radial_distortion_amount");
	uni_use_radial_distortion =     shader_get_uniform(shd_CRT_Shader, "uni_use_radial_distortion");
	uni_use_border =                shader_get_uniform(shd_CRT_Shader, "uni_use_border");
	uni_use_RGB_separation =        shader_get_uniform(shd_CRT_Shader, "uni_use_RGB_separation");
	uni_use_scanlines =				shader_get_uniform(shd_CRT_Shader, "uni_use_scanlines");
	uni_use_noise =					shader_get_uniform(shd_CRT_Shader, "uni_use_noise");
	uni_border_corner_size =        shader_get_uniform(shd_CRT_Shader, "uni_border_corner_size");
	uni_border_corner_smoothness =  shader_get_uniform(shd_CRT_Shader, "uni_border_corner_smoothness");
	uni_brightness =				shader_get_uniform(shd_CRT_Shader, "uni_brightness");
	uni_noise_strength =			shader_get_uniform(shd_CRT_Shader, "uni_noise_strength");
	uni_timer =						shader_get_uniform(shd_CRT_Shader, "uni_timer");

	surface_width  =				camera_get_view_width(_crt_camera);
	surface_height =				camera_get_view_height(_crt_camera);

	_constant_border_size = var_border_corner_size;
	_init_boarder_size = var_border_corner_size;
	_crt_off_state_starting_point = 2;
	_crt_on_state_starting_point = var_border_corner_size;
	_crt_on_off_state = true;

	surface_resize(application_surface, surface_width, surface_height);


}
