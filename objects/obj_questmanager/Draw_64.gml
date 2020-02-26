var ds_height = ds_grid_height(ds_quests)

var i=0;repeat(ds_height){
	var shortdarr=ds_quests[# 3,i]
	if ds_quests[# 0,i]!=-1{
		draw_text(5,5+(16*i),string(ds_quests[# 1,i])+":"
		+string(ds_quests[# 0,i])+"/"
		+string(array_length_1d(ds_quests[# 5,i]))+" "
		+string(shortdarr[ds_quests[# 0,i]]))
	}
	i++
}

//Draw quest notifications about starting quest, updating and completing
if txtalpha!=0{
	var guiwidth=display_get_gui_width(),guiheight=display_get_gui_height()
	draw_set_font(fnt_verylarge)
	draw_set_halign(fa_center)
	draw_text_color(guiwidth/2,guiheight/2-200,notificationquestname,txtcolor,txtcolor,txtcolor,txtcolor,txtalpha)
	draw_text_color(guiwidth/2,guiheight/2-180,scr_find_keyword("notificationqueststate_"+string(notificationqueststate)),txtcolor,txtcolor,txtcolor,txtcolor,txtalpha)
}