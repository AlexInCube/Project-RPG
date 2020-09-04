///@description scr_quest_update(questid)
///@arg questid
function scr_quest_update(argument0) {
	var questid = argument0

	with (obj_questmanager)
	{
		global.ds_current_quests[? string(questid)] = 0//Quest Progress
		notificationquestname=ds_quests[# 0,questid]//Get quest name
		if scr_quest_get_current_stage(questid)==0{
		notificationqueststate=0//Quest start
		txtcolor=c_blue
		}else if scr_quest_get_task_amount(questid)>global.ds_current_quests[? string(questid)]{
		notificationqueststate=1//Quest updated
		txtcolor=c_orange
		}else if scr_quest_get_task_amount(questid)+1==global.ds_current_quests[? string(questid)]{
		notificationqueststate=2//Quest completed
		txtcolor=c_lime
		tracking_quest=noone
		ds_map_delete(global.ds_current_quests,string(questid))
		}
		txtalpha=1
		alarm[0]=notificationtime
	
		if global.ds_current_quests[? string(questid)]!= -1 and scr_quest_get_task_amount(questid)>=global.ds_current_quests[? string(questid)]{
	
		var listener = instance_create_depth(0,0,0,obj_questlistener)
		with listener
			{
			quest_id=questid
			event_user(0)
			}
		}
	}
}
