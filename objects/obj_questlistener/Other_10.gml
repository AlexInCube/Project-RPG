var stagenumber = global.ds_current_quests[? string(quest_id)]//Quest Progress
var stagearray = obj_questmanager.ds_quests[# 4,quest_id]//Link to array with tasks
var stage = stagearray[stagenumber]//Access to task
quest_type=stage[0]//Task type




switch(quest_type)
{
	case questtype.kill: 
	need_kill = stage[1]
	number_of_kills = stage[2]
	event_register([event.enemyKilled,need_kill],id,task_kill,quest_id) 
	break
	
	case questtype.trigger:
	event_register([event.trigger,stage[1]],id,task_trigger,quest_id)
	break
	
	case questtype.craft: break
	
	case questtype.talk:
	event_register([event.talk,stage[1]],id,task_trigger,quest_id)
	break
	
	case questtype.deliver:
	event_register([event.deliver,stage[1],stage[2]],id,task_deliver,quest_id)
	break
	
	case questtype.pickup_item:
	event_register([event.itemPickuped,stage[1],stage[2]],id,task_trigger,quest_id)
	break
	
	case questtype.item_in_slot:
																		   //Inv	//SlotID //Item
	event_register([event.inventory_clicked,stage[1]],id,task_item_in_slot,stage[1],stage[2],stage[3],quest_id)
	break
}