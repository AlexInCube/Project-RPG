///@description scr_quest_get_short_description_for_task(questid)
///@arg questid
var questid = argument0
var sdescarray = obj_questmanager.ds_quests[# 3,questid]//Link to array with tasks
return sdescarray