/*
with(obj_player){
	draw_line(obj_player.x-45,obj_player.y-45,obj_player.x+45,obj_player.y+45)
	draw_line(obj_player.x-45,obj_player.y+45,obj_player.x+45,obj_player.y-45)
	draw_text(obj_player.x,obj_player.y-45,point_direction(x,y,mouse_x,mouse_y))
}