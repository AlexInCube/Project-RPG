///@description scr_quest_get_current_task(questid)
///@arg questid
function scr_quest_get_current_task(argument0) {
	var questid = argument0
	var stagenumber = obj_questmanager.ds_quests[# 0,questid]//Quest Progress
	var stagearray = obj_questmanager.ds_quests[# 5,questid]//Link to array with tasks
	var stage = stagearray[stagenumber]//Access to task
	return stage


}
