///@description scr_quest_start
///@arg questid
var questid = argument0

with (obj_questmanager)
{
	ds_quests[# 0,questid] +=1
}

var listener = instance_create_depth(0,0,0,obj_listener)


with listener{
	quest_id=questid
	event_user(0)
}