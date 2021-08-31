function quest_default_struct() constructor{
	quest_unlocale_name = ""
	quest_locale_name = find_keyword(quest_unlocale_name)//Quest localized name for player
	quest_description = find_keyword(quest_unlocale_name+"_description")//Description for player
	quest_tasks = [
		[quest_type.kill,obj_enemy_slime,3]
	]
	//Auto fill short task descriptions
	var arr_len = array_length(quest_tasks)
	quest_short_tasks_description = array_create(arr_len)
	for(var i = 0;i<arr_len;i++){
		quest_short_tasks_description[i] = find_keyword(quest_unlocale_name+"_short_task_description_"+string(i))
	}
	//Auto fill long task descriptions
	quest_long_tasks_description = array_create(arr_len)
	for(var i = 0;i<arr_len;i++){
		quest_long_tasks_description[i] = find_keyword(quest_unlocale_name+"_long_task_description_"+string(i))
	}
}

function register_quest(quest_name, task_array){
	var ds_size = ds_list_size(global.quest_index)
	global.quest_index[| ds_size] = new quest_default_struct()
	with(global.quest_index[| ds_size]){
		quest_unlocale_name = quest_name
		quest_locale_name = find_keyword(quest_unlocale_name)//Quest localized name for player
		quest_description = find_keyword(quest_unlocale_name+"_description")//Description for player
		quest_tasks = task_array
		//Auto fill short task descriptions
		var arr_len = array_length(quest_tasks)
		quest_short_tasks_description = array_create(arr_len)
		for(var i = 0;i<arr_len;i++){
			quest_short_tasks_description[i] = find_keyword(quest_unlocale_name+"_short_task_description_"+string(i))
		}
		//Auto fill long task descriptions
		quest_long_tasks_description = array_create(arr_len)
		for(var i = 0;i<arr_len;i++){
			quest_long_tasks_description[i] = find_keyword(quest_unlocale_name+"_long_task_description_"+string(i))
		}
	}
}

function quest_give_all_quest(){
	for(var i=0;i<ds_list_size(global.quest_index);i++){
		quest_start(global.quest_index[| i].quest_unlocale_name)
	}
	with(obj_quest_screen){
		quest_list_ds_height = ds_list_size(quest_list)	
	}
}

function quest_start(questid){
	with(obj_questmanager){
		//Quest Name, Quest Progress, Progress in Task
		for(var i = 0; i<ds_list_size(ds_current_quests);i++){
			if ds_current_quests[| i][@ 0] = questid{
				exit
			}
		}
		ds_current_quests[| ds_list_size(ds_current_quests)] = [questid,0,0]
		quest_update_notify(questid)
		if tracking_quest == undefined{
			quest_tracking_update(questid)
		}
		with instance_create_depth(0,0,0,obj_questlistener){
			quest_id=questid
			alarm[0]=1
		}
	}
}
///@description Show notification about quest status
function quest_update_notify(quest_id){
	//Quest Progress
		var cur_array = get_current_quest_array(quest_id)
		var quest_struct = return_struct_from_quest_index_by_quest_id(quest_id)
		notificationquestname = quest_struct.quest_locale_name//Get quest name
		var task_amount = quest_get_task_amount(quest_struct)

		if cur_array[@ quest_data.progress]==0{
			notificationqueststate=0//Quest start
			txtcolor=c_white
		}else if task_amount>cur_array[@ quest_data.progress]{
			notificationqueststate=1//Quest updated
			txtcolor=c_orange
		}else if task_amount+1==cur_array[@ quest_data.progress]{
			notificationqueststate=2//Quest completed
			txtcolor=c_lime
		}
		
		txtalpha=1
		alarm[0]=notificationtime
}

function quest_update(quest_id) {
	with (obj_questmanager)
	{
		//Quest Progress
		var cur_array = get_current_quest_array(quest_id)
		cur_array[@ quest_data.progress]++
		var quest_struct = return_struct_from_quest_index_by_quest_id(quest_id)
		var task_amount = quest_get_task_amount(quest_struct)
		
		quest_update_notify(quest_id)
		
		//If quest competed
		if task_amount+1==cur_array[@ quest_data.progress]{
			ds_list_delete(ds_current_quests,ds_list_find_index(ds_current_quests,get_current_quest_array(quest_id)))
			with(obj_questlistwindow){
				selectedquest=undefined
			}
			tq_name = ""
			tq_desc = ""
			tracking_quest = undefined
			exit
		}else if quest_id = tracking_quest{//If quest still continue
			quest_tracking_update(quest_id)
		}


		if task_amount>=cur_array[@ quest_data.progress]{
			with instance_create_depth(0,0,0,obj_questlistener){
				self.quest_id=quest_id
				alarm[0]=1
			}
		}
	}
}


function quest_tracking_update(quest_id){
	if is_undefined(quest_id)exit
	with obj_questmanager{
		var quest_struct = return_struct_from_quest_index_by_quest_id(quest_id)
		if is_undefined(quest_struct)exit
		tracking_quest = quest_id

		var stage_array = get_current_quest_array(quest_id)//Get array in current quest list
		var quest_progress = stage_array[@ quest_data.progress]//Quest Progress
		tq_name = quest_struct.quest_locale_name//Get quest name
		var quest_t = quest_struct.quest_tasks[@ quest_progress][@ 0]
		switch(quest_t){
			case quest_type.kill:
				var cur_progress = string(stage_array[@ quest_data.task_progress])
				var need_progress = string(quest_struct.quest_tasks[@ quest_progress][@ 2])
				tq_desc=quest_struct.quest_short_tasks_description[@ quest_progress]+" "+cur_progress+"/"+need_progress
			break;
				
			default: tq_desc=quest_struct.quest_short_tasks_description[@ quest_progress]
		}
	}
}

function return_struct_from_quest_index_by_quest_id(quest_id){
	for (var i=0;i<ds_list_size(global.quest_index);i++){
		var s = global.quest_index[| i][$ "quest_unlocale_name"]
		if global.quest_index[| i][$ "quest_unlocale_name"] == quest_id{
			return global.quest_index[| i]
		}
	}
	return undefined
}

function get_current_quest_array(quest_id){
	with obj_questmanager{
		for (var i=0;i<ds_list_size(ds_current_quests);i++){
			if ds_current_quests[| i][@ 0] == quest_id{
				return ds_current_quests[| i]
			}
		}
	return undefined
	}
}

function quest_get_task_amount(quest_struct) {
	var tasklength = array_length(quest_struct.quest_tasks)-1
	return tasklength
}

function deliver_items(item,amount){
	if item_grab(item,amount,global.inventory){
		event_fire([event.deliver,item,amount])
	}
}
