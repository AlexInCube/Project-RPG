///@description scr_quest_get_description(questid)
///@arg questid
var questid = argument0
var description = obj_questmanager.ds_quests[# 2,questid]//Quest description
return description