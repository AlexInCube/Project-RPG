/// @description Insert description here
// You can write your code in this editor
scr_get_input()
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