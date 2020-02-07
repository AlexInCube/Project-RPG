scr_get_input()

if developer_key
{
	cheat = get_string("Enter cheat","")

	if cheat == "heal"
	{
		obj_player_stats.hp=obj_player_stats.maxhp
	}
	
	if cheat == "mana"
	{
		obj_player_stats.mana=obj_player_stats.mana
	}
}

if pause_key {
	psb = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0);
	show_debug_message(psb)
	if room != room_pause{
		if instance_exists(obj_player){
			obj_player.persistent=false
		}
		previous_room = room
		room_persistent=true
		room_goto(room_pause)
	}else{
		sprite_delete(psb)
		
		psb=0
		room_goto(previous_room)
		room_persistent=false
	}
}

if exittomenu=true
{
	room_persistent=false
	persistent=false
	obj_player_stats.persistent=false
	obj_player.persistent=false
	obj_inventory.persistent=false
	room_goto(room_main)
}