function open_quest_list() {
	if !instance_exists(questlistwindow){
		questlistwindow=create_window(questlist_window_x,questlist_window_y,obj_questlistwindow)
	}else{
		instance_destroy(questlistwindow)
	}
}