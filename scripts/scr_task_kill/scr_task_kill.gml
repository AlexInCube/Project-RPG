count+=1
var questid = argument0
if count>=number_of_kills{
	with obj_questmanager{
	ds_quests[# 0,questid]+=1	
	}
	scr_quest_start(questid)
	instance_destroy()
}
