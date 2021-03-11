//Quest Types
enum quest_type {
	kill,
	trigger,
	talk,
	craft,
	deliver,
	pickup_item,
	item_in_slot
}

ds_current_quests = ds_list_create()//List of active quests (store the ID and Progress)

enum quest_data{
	name,
	progress,
	task_progress
}

//For notification about start/fail/complete quest
notificationquestname=""
notificationqueststate=-1
notificationtime=180
txtalpha=0
txtcolor=c_orange
//Display quest which player want to track
tracking_quest=undefined
quest_tracking_update(tracking_quest)