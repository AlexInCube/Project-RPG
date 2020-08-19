///@description scr_quest_get_name(questid)
///@arg questid
function scr_quest_get_name(argument0) {
	var questid = argument0
	var name = obj_questmanager.ds_quests[# 1,questid]//Quest name
	return name


}
