///@description quest_update(questid)
///@arg questid
function quest_update(questid) {
	with (obj_questmanager)
	{
		//Quest Progress
		if global.ds_current_quests[? string(questid)] == undefined{
			global.ds_current_quests[? string(questid)] = 0
		}else{
			global.ds_current_quests[? string(questid)] += 1 
		}
		notificationquestname=ds_quests[# 0,questid]//Get quest name
		if quest_get_current_stage(questid)==0{
		notificationqueststate=0//Quest start
		txtcolor=c_blue
		}else if quest_get_task_amount(questid)>global.ds_current_quests[? string(questid)]{
		notificationqueststate=1//Quest updated
		txtcolor=c_orange
		}else if quest_get_task_amount(questid)+1==global.ds_current_quests[? string(questid)]{
		notificationqueststate=2//Quest completed
		txtcolor=c_lime
		tracking_quest=noone
		ds_map_delete(global.ds_current_quests,string(questid))
		}
		txtalpha=1
		alarm[0]=notificationtime
	
		if global.ds_current_quests[? string(questid)]!= -1 and quest_get_task_amount(questid)>=global.ds_current_quests[? string(questid)]{
			with instance_create_depth(0,0,0,obj_questlistener){
				quest_id=questid
				event_user(0)
			}
		}
		
		tracking_update(questid)
	}
}
