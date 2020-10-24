///@description CallUserEvent(eventNum, args)
///@param eventNumber
///@param args
// Assumes an object is calling implicitly, may prefer to add in an object argument for clarity
function CallUserEvent(argument0,argument1){
	var eventNum = argument0;
	var args = argument1;

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
///@arg target_y
function change_camera_mode(){
	with(obj_camera){
		mode = argument[0]
		
		switch(mode){
			case camera_mode.move_to_target:
				target_x = argument[1]
				target_y = argument[2]
			break
			
			case camera_mode.follow_object:
			case camera_mode.move_to_follow_object:
				following = argument[1]
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
function mouseover(argument0, argument1, argument2, argument3) {
	var xx=argument0
	var yy=argument1
	var xx2=argument2
	var yy2=argument3

	return point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),xx,yy,xx2,yy2)
}

///@description draw_light(light_radius)
///@function draw_light
///@param light_radius
function draw_light(size){
	if instance_exists(obj_lighting){
		if surface_exists(global.light){
			gpu_set_blendmode(bm_subtract)
			surface_set_target(global.light)
			var camera_x = camera_get_view_x(camera), camera_y = camera_get_view_y(camera)
			draw_ellipse_color(x - size / 2 - camera_x, y - size / 2 - camera_y, x + size / 2 - camera_x, y + size / 2 - camera_y,c_orange,c_black,false)
			surface_reset_target()
			gpu_set_blendmode(bm_normal)
		}
	}
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
	draw_rectangle_color(x1,y1,x2,y2,color,color,color,color,outline)
}

///@description draw_text_color_fast(xx,yy,string,color,alpha)
///@function draw_text_color_fast
///@param xx
///@param yy
///@param string
///@param color
///@param alpha
function draw_text_color_fast(xx,yy,string,color,alpha){
	draw_text_color(xx,yy,string,color,color,color,color,alpha)
}

///@description get_exp(integer)
///@function get_exp
///@param amount_xp
function get_exp(experience){
	with (obj_player_stats){
		expr+=experience
		if expr>max_expr{
			level +=1
			expr = expr-max_expr
			max_expr *=2
			skillpoints +=1
		}
	}
}