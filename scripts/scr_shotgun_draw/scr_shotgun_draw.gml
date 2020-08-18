x = obj_player.x
y = obj_player.y
switch(obj_player.face){
	case UP: depth = -(obj_player.y-obj_player.spd) break;
	case DOWN: depth = -(obj_player.y+obj_player.spd )break;
	default: depth = -(obj_player.y+obj_player.spd)

}

var mouse_dir = point_direction(x,y,mouse_x,mouse_y)
if mouse_dir>=90 and mouse_dir<=270{
draw_sprite_ext(spr_item_weapon_shotgun,0,obj_player.x,obj_player.y,1,-1,mouse_dir,c_white,1)
}else{
draw_sprite_ext(spr_item_weapon_shotgun,0,obj_player.x,obj_player.y,1,1,mouse_dir,c_white,1)
}