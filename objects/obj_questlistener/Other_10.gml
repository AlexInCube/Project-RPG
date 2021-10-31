var stage_array = get_current_quest_array(quest_id)
var stagenumber = stage_array[@ quest_data.progress]//Quest Progress

var stage_struct = return_struct_from_quest_index_by_quest_id(quest_id)//Link to array with tasks
var stage = stage_struct.quest_tasks[stagenumber]//Access to task
questtype=stage[0]//Task type


switch(questtype)
{
	case quest_type.kill: 
		need_kill = stage[1]
		number_of_kills = stage[2]
		event_register(id,EVENT_ENEMY_KILLED,task_kill,[quest_id,need_kill]) 
	break
	
	case quest_type.trigger:
		event_register([EVENT_TRIGGER,stage[1]],id,task_trigger,quest_id)
	break
	
	case quest_type.craft: break
	
	case quest_type.talk:
		event_register([EVENT_NPC_TALK,stage[1]],id,task_trigger,quest_id)
	break
	
	case quest_type.deliver:
		event_register([EVENT_NPC_DELIVER,stage[1],stage[2]],id,task_deliver,quest_id)
	break
	
	case quest_type.pickup_item:
		event_register(id,EVENT_ITEM_PICKUPED,task_pickup_item,[quest_id,stage[1],stage[2]])
	break
	
	case quest_type.item_in_slot:
																			  //Inv	//SlotID //Item
		event_register([EVENT_INVENTORY_CLICKED,variable_global_get(stage[1])],id,task_item_in_slot,stage[1],stage[2],stage[3],quest_id)
	break
}