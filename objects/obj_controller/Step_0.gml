//Updating GW and GH
scr_get_input()//Update keyboard/mouse input

//Update window crossing
scr_getwindowcross()



//Call cheat "console"
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

//Call pause
if pause_key {
	psb = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0);

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
		
	}
}

//This need to reset obj data (inventory, stats and etc...)
if exittomenu=true
{
	room_persistent=false
	persistent=false
	obj_player_stats.persistent=false
	if instance_exists(obj_player) obj_player.persistent=false
	obj_inventory.persistent=false
	room_goto(room_main)
}
