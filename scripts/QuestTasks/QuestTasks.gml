
function task_kill(questid,entity,ev) {
	if ev.entity_name != entity exit
	
	var stage_array = get_current_quest_array(quest_id)//Get array in current quest list
	stage_array[@ quest_data.task_progress]++//Quest Progress
	
	if obj_questmanager.tracking_quest == questid{
		quest_tracking_update(questid)
	}
	if stage_array[@ quest_data.task_progress]>=number_of_kills{
		quest_update(questid)
		instance_destroy()
	}
}

function task_npc_talk(questid,npc,ev) {
	if ev.npc_obj == npc{
		quest_update(questid)
		instance_destroy()
	}
}

function task_trigger(questid,trigger,ev) {
	if ev.trigger_id == trigger{
		quest_update(questid)
		instance_destroy()
	}
}

function task_pickup_item(questid,item,quantity,ev) {
	if ev.item = item and ev.quantity = quantity{ 
		quest_update(questid)
		instance_destroy()
	}
}

function task_deliver(questid,item,quantity,ev) {
	if ev.item == item and ev.quantity == quantity{
		quest_update(questid)
		instance_destroy()
	}
}

function task_item_in_slot(questid,inventory_name,slot_id,item_id,ev) {
	if variable_global_exists(inventory_name){
		var inventory = variable_global_get(inventory_name)
		if ev.inv != inventory exit
	}else{
		console_log("INVENTORY NOT EXISTS, WHAT ARE PUT IN QUEST TASK?")
		exit
	}
	
	if inventory[# slot_id, 0] == item_id{
		quest_update(questid)
		instance_destroy()
	}
}
