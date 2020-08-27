function scr_open_quest_list() {
	if !instance_exists(questlistwindow){
		var xx=(GUIWIDTH/2)-450/2
		var yy=(GUIHEIGHT/2)-300/2
		questlistwindow = instance_create_depth(xx,yy,0,obj_questlistwindow)
		questlistwindow.window_x=xx
		questlistwindow.window_y=yy
		questlistwindow.xx=xx
		questlistwindow.yy=yy
		questlistwindow.persistent=true
	}else{
		instance_destroy(questlistwindow)
	}


}
