/// @func scr_CRT_turn_on_effect(speed);
/// @desc Emulates a CRT TV turning on.
/// @param speed Controls how qucikly the effect is applied. Default = 0.015
function scr_CRT_turn_on_effect(argument0) {

	_speed = argument0;

	if (_crt_off_state_starting_point > _init_boarder_size) and (_crt_on_off_state = false) {
	  _crt_off_state_starting_point -= _speed;
	  var_border_corner_size = _crt_off_state_starting_point;
	} else { 
	  var_border_corner_size = _constant_border_size;
	  _crt_off_state_starting_point = 2;
	  _crt_on_off_state = true;
	  }

	return _crt_on_off_state;


}
