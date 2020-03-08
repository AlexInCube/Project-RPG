if !instance_exists(obj_textbox)
{
	var ds_height = ds_grid_height(ds_quests)

	var i=0;repeat(ds_height){
		if scr_quest_get_current_stage(i)> -1{
			draw_text(5,5+(16*i),string(scr_quest_get_name(i))+":"
			+string(scr_quest_get_current_stage(i))+"/"+string(scr_quest_get_task_amount(i)+1)+" "
			+string(scr_quest_get_short_description_for_task(i)))
		}
		i++
	}
}

//Draw quest notifications about starting quest, updating and completing
if txtalpha!=0{

	draw_set_font(fnt_verylarge)
	draw_set_halign(fa_center)
	scr_draw_text_shadow(global.guiwidth/2,global.guiheight/2-200,notificationquestname,fnt_verylarge,2,c_black,txtcolor,txtalpha)
	scr_draw_text_shadow(global.guiwidth/2,global.guiheight/2-180,scr_find_keyword("notificationqueststate_"+string(notificationqueststate)),fnt_verylarge,2,c_black,txtcolor,txtalpha)
}