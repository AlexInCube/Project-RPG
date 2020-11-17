/*
0 - Quest Name
1 - Quest Description
2 - Short Descriptions
3 - Long Descriptions
4 - Requirements/tasks
*/
function deliver_items(item,amount){
	if give_item(item,amount){
	event_fire([event.deliver,item,amount])
	}
}

function tracking_update(t_q){
	with obj_questmanager{
		if t_q!=noone{
			tq_name=string(quest_get_name(t_q))
			var quest_t = quest_get_task_type(t_q)
			switch(quest_t){
				case questtype.kill:
					tq_desc=quest_get_short_description_for_task(t_q,global.ds_current_quests[? string(t_q)])+" "+quest_return_progress_string(t_q)
				break;
				
				default: tq_desc=quest_get_short_description_for_task(t_q,global.ds_current_quests[? string(t_q)])
			}
		}
	}
}

function quest_return_progress_string(questid){
	var n_k = quest_get_current_task(questid)
	var quest_t = quest_get_task_type(questid)
			switch(quest_t){
				case questtype.kill:
					return string(quest_get_count(questid))+"/"+string(n_k[2])
				break;
				
				default: 
			}
	return ""
}
///@description quest_get_current_task(questid)
///@arg questid
function quest_get_current_task(questid) {
	var stagenumber = global.ds_current_quests[? string(questid)]//Quest Progress
	var stagearray = obj_questmanager.ds_quests[# 4,questid]//Link to array with tasks
	var stage = stagearray[stagenumber]//Access to task
	return stage
}

function quest_get_task_type(questid){
	var stage = quest_get_current_task(questid)
	return stage[0]
}

function quest_get_count(questid) {
	if quest_get_task_type(questid) = questtype.kill{
		with(obj_questlistener){
			if quest_id == questid{
				return count
			}
		}
	}else{
		return -1
	}
}
///@description quest_get_task_amount(questid)
///@arg questid
/*
	Get total task amount
*/
function quest_get_task_amount(questid) {
	var stagearray = obj_questmanager.ds_quests[# 4,questid]//Link to array with tasks
	var tasklength = array_length_1d(stagearray)-1
	return tasklength
}

///@description quest_get_short_description_for_task(questid)
///@arg questid
function quest_get_short_description_for_task(questid,stagenumber) {
	var sdescarray = obj_questmanager.ds_quests[# 2,questid]//Link to array with tasks
	var sdesc = sdescarray[stagenumber]//Access to task
	return sdesc
}

///@description quest_get_tasks_array(questid)
///@arg questid
function quest_get_tasks_array(questid) {
	var sdescarray = obj_questmanager.ds_quests[# 2,questid]//Link to array with tasks
	return sdescarray
}

///@description quest_get_long_description_for_task(questid)
///@arg questid
function quest_get_long_description_for_task(questid) {
	var stagenumber = global.ds_current_quests[? string(questid)]//Quest Progress
	var ldescarray = obj_questmanager.ds_quests[# 3,questid]//Link to array with tasks
	var ldesc = ldescarray[stagenumber]//Access to task
	return ldesc
}

///@description quest_get_current_stage(questid)
///@arg questid
function quest_get_current_stage(questid) {
	var stage = global.ds_current_quests[? string(questid)]//Quest current stage
	return stage
}

///@description quest_get_name(questid)
///@arg questid
function quest_get_name(questid) {
	var name = obj_questmanager.ds_quests[# 0,questid]//Quest name
	return name
}

///@description quest_get_description(questid)
///@arg questid
function quest_get_description(questid) {
	var description = obj_questmanager.ds_quests[# 1,questid]//Quest description
	return description
}
