///@description scr_quest_get_short_description_for_task(questid)
///@arg questid
function scr_quest_get_short_description_for_task(argument0) {
	var questid = argument0
	var stagenumber = obj_questmanager.ds_quests[# 0,questid]//Quest Progress
	var sdescarray = obj_questmanager.ds_quests[# 3,questid]//Link to array with tasks
	var sdesc = sdescarray[stagenumber]//Access to task
	return sdesc


}
