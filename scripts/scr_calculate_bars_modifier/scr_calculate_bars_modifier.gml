/// @arg value
/// @arg old_min
/// @arg old_max
/// @arg new_min
/// @arg new_max
function calculate_bars_modifier(argument0, argument1, argument2, argument3, argument4) {

	var old_value   = argument0;
	var old_min		= argument1;
	var old_max		= argument2;
	var new_min		= argument3;
	var new_max		= argument4;

	var old_range	= (old_max - old_min);
	var new_range	= (new_max - new_min);
	var new_value	= (((old_value - old_min) * new_range) / old_range) + new_min;

	return new_value;


}
