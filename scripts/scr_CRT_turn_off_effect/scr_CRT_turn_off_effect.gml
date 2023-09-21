/// @func scr_CRT_turn_off_effect(speed);
/// @desc Emulates a CRT TV turning off.
/// @param speed Controls how qucikly the effect is applied. Default = 0.015
function scr_CRT_turn_off_effect(argument0) {

	_speed = argument0;

	if (_crt_on_state_starting_point < 2.0) and (_crt_on_off_state = true) {
	  _crt_on_state_starting_point += _speed;
	  var_border_corner_size = _crt_on_state_starting_point;
	} else {
	  _crt_on_state_starting_point = _constant_border_size;
	  _crt_on_off_state = false;
	}

	return _crt_on_off_state;


}
