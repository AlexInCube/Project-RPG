function task_kill(argument0) {
	count+=1
	tracking_update(argument0)
	var questid = argument0
	if count>=number_of_kills{
		quest_update(questid)
		instance_destroy()
	}
}
