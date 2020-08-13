///@description move_character
///@arg obj
///@arg x
///@arg y
///@arg relative?
///@arg spd
show_debug_message("moving "+" x:"+string(x_dest)+" y:"+string(y_dest))
var obj = argument0, relative = argument3, spd = argument4

if (x_dest == -1){
	if(!relative){
		x_dest = argument1
		y_dest = argument2
	}else{
		x_dest = obj.phy_position_x+argument1
		y_dest = obj.phy_position_y+argument2
	}
}

var xx = x_dest, yy = y_dest

with(obj){
	if point_distance(phy_position_x,phy_position_y,xx,yy)>=spd{
		var dir = point_direction(phy_position_x,phy_position_y,xx,yy)
		var ldirx = lengthdir_x(spd,dir)
		var ldiry = lengthdir_y(spd,dir)
		
		phy_position_x += ldirx
		phy_position_y += ldiry
	}else{
		phy_position_x = xx
		phy_position_y = yy
		
		with(other){
			x_dest = -1
			y_dest = -1
			scr_cutscene_end_action()
		}
	}
}