///@description scr_create_window
///@arg window_sprite
///@arg window_name
///@arg window_width
///@arg window_height
///@arg window_script_screen_id
///@arg window_screen_arguments(array)
function scr_create_window(argument0, argument1, argument2, argument3, argument4, argument5) {

	var window_sprite = argument0
	var window_name = argument1
	var window_width = argument2
	var window_height = argument3
	var window_script_screen_id = argument4
	var window_screen_arguments = argument5

	var window = instance_create_depth(0,0,0,obj_basicwindow)
	if window_width == 0 or window_height == 0{
		window.window_width=sprite_get_width(window_sprite)
		window.window_height=sprite_get_height(window_sprite)
	}else{
		window.window_width=window_width
		window.window_height=window_height
	}
	with(obj_basicwindow){
		activewindow=false
	}
	window.activewindow=true
	scr_windowsetdepth()
	window.window_sprite=window_sprite
	window.window_name=scr_find_keyword(window_name)
	window.guiscreen = window_script_screen_id
	window.guiscreenarg = window_screen_arguments

	return window


}
