///@description scr_quest_start(questid)
///@arg questid
var questid = argument0


with (obj_questmanager)
{
	if ds_quests[# 0,questid]> -1{
		notificationquestname=ds_quests[# 1,questid]//Get quest name
		notificationqueststate=3//Quest failed
		ds_quests[# 0,questid]=-3//-3 means quest failed
		txtalpha=1
		alarm[0]=notificationtime
		txtcolor=c_red
	
		with(obj_listener)
		{
			if quest_id=questid{instance_destroy()}
		}
	}
}


