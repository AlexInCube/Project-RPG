///@description add_quest(array) Adding quest to ds_quests, but dont start quest.
///@arg array
function add_quest(argument0) {
	var quest = argument0
	var name = quest[0]
	var description = quest[1]
	var shortd = quest[2]//short description
	var longd = quest[3]//long description
	var req = quest[4]//requirements
	with obj_questmanager
	{
		var grid_height = ds_grid_height(ds_quests),grid_width = ds_grid_width(ds_quests)
		ds_grid_resize(ds_quests,grid_width+array_length(quest)+1,grid_height+1)//TODO:rewrite to avoid memory leak
	
		ds_quests[# 0,grid_height] = name
		ds_quests[# 1,grid_height] = description
		ds_quests[# 2,grid_height] = shortd
		ds_quests[# 3,grid_height] = longd
		ds_quests[# 4,grid_height] = req
		/*
		show_debug_message(ds_quests[# 0,grid_height])
		show_debug_message(ds_quests[# 1,grid_height])
		show_debug_message(ds_quests[# 2,grid_height])
		show_debug_message(ds_quests[# 3,grid_height])
		show_debug_message(ds_quests[# 4,grid_height])
		show_debug_message(ds_quests[# 5,grid_height])
		*/
	}
}
