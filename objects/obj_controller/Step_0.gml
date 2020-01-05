/// @description Insert description here
// You can write your code in this editor
scr_get_input()

if developer_key
{
	cheat = get_string("Enter cheat","")

	if cheat == "guilarge"
	{
		display_set_gui_size(960, 540)
	}
	
	if cheat == "guismall"
	{
		display_set_gui_size(global.width, global.height)
	}
	
	if cheat == "heal"
	{
		obj_player_stats.hp=obj_player_stats.maxhp
	}
	
	if cheat == "mana"
	{
		obj_player_stats.mana=obj_player_stats.mana
	}
	
	if cheat == "zoomin"
	{
		camera_set_view_size(view_camera[0],960/2,540/2);
	}
	
	if cheat == "zoomout"
	{
		camera_set_view_size(view_camera[0],global.width/2,global.height/2);
	}
}

if pause_key {
	if room != room_pause{
		if instance_exists(obj_player){
			obj_player.persistent=false
		}
		previous_room = room
		room_goto(room_pause)
	}else{
		room_goto(previous_room)
	}
}