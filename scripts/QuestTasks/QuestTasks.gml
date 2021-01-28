function task_kill(questid) {
	count+=1
	tracking_update(questid)
	if count>=number_of_kills{
		quest_update(questid)
		instance_destroy()
	}
}

function task_trigger(questid) {
	quest_update(questid)
	instance_destroy()
}

function task_deliver(questid) {
	quest_update(questid)
	instance_destroy()
}

function task_item_in_slot(inventory,slot_id,item_id,questid) {
	if inventory[# slot_id, 0] == item_id{
		quest_update(questid)
		instance_destroy()
	}
}
