///@description scr_quest_get_short_description_for_task(questid)
///@arg questid
function scr_quest_get_tasks_array(argument0) {
	var questid = argument0
	var sdescarray = obj_questmanager.ds_quests[# 3,questid]//Link to array with tasks
	return sdescarray


}
