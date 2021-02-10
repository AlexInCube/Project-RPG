if exist_story_tag("ewgen_saved_from_slimes"){
	exit
}
path_start(path_ewgen_run,1,path_action_continue,false)
event_register([event.enemyKilled,obj_enemy_slime],id,ewgen_if_no_more_slimes)
