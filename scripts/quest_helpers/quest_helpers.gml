/*
0 - Quest Name
1 - Quest Description
2 - Short Descriptions
3 - Long Descriptions
4 - Requirements/tasks
*/

///@description scr_quest_get_current_task(questid)
///@arg questid
function scr_quest_get_current_task(argument0) {
	var questid = argument0
	var stagenumber = global.ds_current_quests[? string(questid)]//Quest Progress
	var stagearray = obj_questmanager.ds_quests[# 4,questid]//Link to array with tasks
	var stage = stagearray[stagenumber]//Access to task
	return stage
}

///@description scr_quest_get_task_amount(questid)
///@arg questid
/*
	Get total task amount
*/
function scr_quest_get_task_amount(argument0) {
	var questid = argument0
	var stagearray = obj_questmanager.ds_quests[# 4,questid]//Link to array with tasks
	var tasklength = array_length_1d(stagearray)-1
	return tasklength
}

///@description scr_quest_get_short_description_for_task(questid)
///@arg questid
function scr_quest_get_short_description_for_task(argument0,argument1) {
	var questid = argument0
	var stagenumber = argument1//Quest Progress
	var sdescarray = obj_questmanager.ds_quests[# 2,questid]//Link to array with tasks
	var sdesc = sdescarray[stagenumber]//Access to task
	return sdesc
}

///@description scr_quest_get_tasks_array(questid)
///@arg questid
function scr_quest_get_tasks_array(argument0) {
	var questid = argument0
	var sdescarray = obj_questmanager.ds_quests[# 2,questid]//Link to array with tasks
	return sdescarray
}

///@description scr_quest_get_long_description_for_task(questid)
///@arg questid
function scr_quest_get_long_description_for_task(argument0) {
	var questid = argument0
	var stagenumber = global.ds_current_quests[? string(questid)]//Quest Progress
	var ldescarray = obj_questmanager.ds_quests[# 3,questid]//Link to array with tasks
	var ldesc = ldescarray[stagenumber]//Access to task
	return ldesc
}

///@description scr_quest_get_current_stage(questid)
///@arg questid
function scr_quest_get_current_stage(argument0) {
	var questid = argument0
	var stage = global.ds_current_quests[? string(questid)]//Quest current stage
	return stage
}

///@description scr_quest_get_name(questid)
///@arg questid
function scr_quest_get_name(argument0) {
	var questid = argument0
	var name = obj_questmanager.ds_quests[# 0,questid]//Quest name
	return name
}

///@description scr_quest_get_description(questid)
///@arg questid
function scr_quest_get_description(argument0) {
	var questid = argument0
	var description = obj_questmanager.ds_quests[# 1,questid]//Quest description
	return description
}
