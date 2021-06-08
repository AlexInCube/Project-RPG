function register_quests(){
	global.quest_index = ds_list_create()
	
	register_quest("first_steps",[
		[quest_type.pickup_item,"wooden_stick",1],
		[quest_type.item_in_slot,"equipment",4,"wooden_stick"],
		[quest_type.kill,obj_enemy_slime,3]
	])
	
	register_quest("help_for_ewgen",[
		[quest_type.talk,obj_lesha_npc],
		[quest_type.deliver,"wooden_water_bucket",1],
	])
	
	show_debug_message("Registered "+string(ds_list_size(global.quest_index))+" quests")
}