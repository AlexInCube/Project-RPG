///@description scr_quest_get_description(questid)
///@arg questid
function scr_quest_get_description(argument0) {
	var questid = argument0
	var description = obj_questmanager.ds_quests[# 2,questid]//Quest description
	return description


}
