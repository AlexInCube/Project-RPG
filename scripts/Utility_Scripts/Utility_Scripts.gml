function convert_seconds_to_ticks(seconds){
	return seconds*60
}

function convert_ticks_to_seconds(ticks){
	return ticks/60
}


function get_formatted_date(number){
	number = string(number)
	if string_length(number) == 1{
		return string(0)+number
	}else{
		return number
	}
}

/// @function with_tagged(tag, lambda)
/// @param tag The tag or array of tags to operate on
/// @param lambda An inline function to be run
/// Applies the lambda function provided to every instance with a given tag
function with_tagged(tag, lambda) {
	var tagged = tag_get_asset_ids(tag, asset_object);
	for (var i = 0; i < array_length(tagged); i++) {
		with (tagged[i]) {
			var boundMethod = method(self, lambda);
			boundMethod();
		}
	}
}
/// @function is_tagged(tag, obj_id)
/// @param tag
/// @param obj_id
function is_tagged(tag, obj_id) {
	var tags = asset_get_tags(obj_id.object_index,asset_object)
	for (var i = 0; i < array_length(tags); i++) {
		if tags[i] == tag {
			return true
		}
	}
	return false
}
///@description CallUserEvent(eventNum, args)
///@param eventNumber
///@param args
// Assumes an object is calling implicitly, may prefer to add in an object argument for clarity
function CallUserEvent(eventNum,args){
	__eventArgs = args;
	event_user(eventNum);
	__eventArgs = 0; // Clear the argument variable after event call to ensure no unexpected issues
}

///@function screenshake(shake_offset)
///@description Shake camera
///@param shake_offset
function screenshake(shake_offset){
	with(obj_camera){
		shake = shake_offset
	}
}

///@description change_camera_mode
///@arg	mode
///@arg following/target_x
///@arg target_y/camera_speed
function change_camera_mode(){
	with(obj_camera){
		mode = argument[0]
		
		switch(mode){
			case camera_mode.move_to_target:
				target_x = argument[1]
				target_y = argument[2]
			break
			
			case camera_mode.follow_object:
				following = argument[1]
			break
			case camera_mode.move_to_follow_object:
				following = argument[1]
				camera_speed = argument[2]
			break
		}
	}
}

///@description mouseover(xx,yy,xx2,yy2)
///@function mouseover
///@param xx
///@param yy
///@param xx2
///@param yy2
/*
	Used in many GUI function for buttons
*/
function mouseover(xx, yy, xx2, yy2) {
	return point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),xx,yy,xx2,yy2)
}

///@description draw_rectangle_color_fast(x1,y1,x2,y2,color,outline)
///@function draw_rectangle_color_fast
///@param x1
///@param y1
///@param x2
///@param y2
///@param color
///@param outline
function draw_rectangle_color_fast(x1,y1,x2,y2,color,outline){
	draw_set_color(color)
	draw_rectangle(x1,y1,x2,y2,outline)
}

///@description draw_text_color_fast(xx,yy,string,color,alpha)
///@function draw_text_color_fast
///@param xx
///@param yy
///@param string
///@param color
///@param alpha
function draw_text_color_fast(xx,yy,string,color,alpha){
	draw_set_color(color)
	draw_set_alpha(alpha)
	draw_text(xx,yy,string)
}

/// Saving a string as a buffer
function save_string_in_json (_string, _filename) {
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}

/// Loading a string from a buffer
function load_string_from_json (_filename) {
	if !file_exists(_filename)exit
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);

	buffer_delete(_buffer);
	return _string;
}