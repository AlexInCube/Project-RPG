///@description scr_quest_get_long_description_for_task(questid)
///@arg questid
var questid = argument0
var stagenumber = obj_questmanager.ds_quests[# 0,questid]//Quest Progress
var ldescarray = obj_questmanager.ds_quests[# 4,questid]//Link to array with tasks
var ldesc = ldescarray[stagenumber]//Access to task
return ldesc