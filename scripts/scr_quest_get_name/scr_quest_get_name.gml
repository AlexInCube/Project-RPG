///@description scr_quest_get_name(questid)
///@arg questid
var questid = argument0
var name = obj_questmanager.ds_quests[# 1,questid]//Quest name
return name