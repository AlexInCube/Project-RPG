///@description scr_quest_start(questid)
///@arg questid
var questid = argument0

with (obj_questmanager)
{
	ds_quests[# 0,questid] +=1
	notificationquestname=ds_quests[# 1,questid]
	if scr_quest_get_current_stage(questid)==0{
	notificationqueststate=0
	}else if scr_quest_get_task_amount(questid)>ds_quests[# 0,questid]{
	notificationqueststate=1
	}else if scr_quest_get_task_amount(questid)==ds_quests[# 0,questid]{
	notificationqueststate=2
	}
	txtalpha=1
	alarm[0]=notificationtime
}

var listener = instance_create_depth(0,0,0,obj_listener)


with listener{
	quest_id=questid
	event_user(0)
}