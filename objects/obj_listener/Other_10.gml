var stagenumber = obj_questmanager.ds_quests[# 0,quest_id]//Quest Progress
var stagearray = obj_questmanager.ds_quests[# 5,quest_id]//Link to array with tasks
var stage = stagearray[stagenumber]//Access to task

quest_type=stage[0]//Task type




switch(quest_type)
{
	case questtype.kill: 
	need_kill = stage[1]
	number_of_kills = stage[2]
	scr_event_register([event.enemyKilled,need_kill],id,scr_task_kill,quest_id) 
	break
}
