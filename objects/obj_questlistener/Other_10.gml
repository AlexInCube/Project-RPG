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
		event_register([event.enemyKilled,need_kill],id,task_kill,quest_id) 
	break
	
	case quest_type.trigger:
		event_register([event.trigger,stage[1]],id,task_trigger,quest_id)
	break
	
	case quest_type.craft: break
	
	case quest_type.talk:
		event_register([event.talk,stage[1]],id,task_trigger,quest_id)
	break
	
	case quest_type.deliver:
		event_register([event.deliver,stage[1],stage[2]],id,task_deliver,quest_id)
	break
	
	case quest_type.pickup_item:
		event_register([event.itemPickuped,stage[1],stage[2]],id,task_trigger,quest_id)
	break
	
	case quest_type.item_in_slot:
																			  //Inv	//SlotID //Item
		event_register([event.inventory_clicked,variable_global_get(stage[1])],id,task_item_in_slot,stage[1],stage[2],stage[3],quest_id)
	break
}