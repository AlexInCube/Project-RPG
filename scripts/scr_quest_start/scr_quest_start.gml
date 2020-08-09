///@description scr_quest_start(questid)
///@arg questid
var questid = argument0

with (obj_questmanager)
{
	ds_quests[# 0,questid] +=1//Quest Progress
	notificationquestname=ds_quests[# 1,questid]//Get quest name
	if scr_quest_get_current_stage(questid)==0{
	notificationqueststate=0//Quest start
	txtcolor=c_blue
	}else if scr_quest_get_task_amount(questid)>ds_quests[# 0,questid]{
	notificationqueststate=1//Quest updated
	txtcolor=c_orange
	}else if scr_quest_get_task_amount(questid)+1==ds_quests[# 0,questid]{
	notificationqueststate=2//Quest completed
	txtcolor=c_lime
	ds_quests[# 0,questid]=-2//-2 means quest complete
	}
	txtalpha=1
	alarm[0]=notificationtime
	
	if ds_quests[# 0,questid]!=-2 and scr_quest_get_task_amount(questid)>=ds_quests[# 0,questid]{
	
	var listener = instance_create_depth(0,0,0,obj_listener)
	with listener
		{
		quest_id=questid
		event_user(0)
		}
	}
}


