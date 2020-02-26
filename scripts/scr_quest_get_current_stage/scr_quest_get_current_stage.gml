///@description scr_quest_get_current_stage(questid)
///@arg questid
var questid = argument0
var stage = obj_questmanager.ds_quests[# 0,questid]//Quest current stage
return stage