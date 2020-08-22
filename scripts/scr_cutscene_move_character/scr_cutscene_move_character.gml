///@description move_character
///@arg obj
///@arg x
///@arg y
///@arg relative?
///@arg spd
function scr_cutscene_move_character(argument0, argument1, argument2, argument3, argument4) {
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
		
			
			image_speed = sign(spd)*.4
				switch(dir) {
				case RIGHT:
					sprite_index=sprite[RIGHT,MOVE]
					break
		
				case UP:
					sprite_index=sprite[UP,MOVE]
					break
	
				case LEFT:
					sprite_index=sprite[LEFT,MOVE]
					break
	
				case DOWN:
					sprite_index=sprite[DOWN,MOVE]
					break
			}
		}else{
			phy_position_x = xx
			phy_position_y = yy
			image_speed = 0
			with(other){
				x_dest = -1
				y_dest = -1
				scr_cutscene_end_action()
			}
		}
	

	}


}
