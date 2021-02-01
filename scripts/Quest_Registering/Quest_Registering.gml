function registerquests(){
	global.quest_index = ds_list_create()
	
	register_quest("first_steps",[
		[quest_type.pickup_item,"wooden_stick",1],
		[quest_type.item_in_slot,"equipment",4,"wooden_stick"],
		[quest_type.kill,obj_enemy_slime,3]
	])
	
	show_debug_message("Registered "+string(ds_list_size(global.quest_index))+" quests")
}