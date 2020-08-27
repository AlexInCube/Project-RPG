///@description scr_quest_get_task_amount(questid)
///@arg questid
function scr_quest_get_task_amount(argument0) {
	var questid = argument0
	var stagearray = obj_questmanager.ds_quests[# 5,questid]//Link to array with tasks
	var tasklength = array_length_1d(stagearray)-1
	return tasklength


}
