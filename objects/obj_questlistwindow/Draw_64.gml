// Inherit the parent event
draw_set_font(fnt_small)
draw_set_alpha(1)
draw_sprite(window_sprite,0,window_x,window_y-22)

var ds_height = ds_list_size(obj_questmanager.ds_current_quests)

//Draw quest list
if selectedquest==undefined{
	draw_set_halign(fa_middle)
	draw_set_valign(fa_top)
	draw_set_color(c_black)
	draw_text(window_x+169,window_y+35,window_name)
	draw_set_halign(fa_left)
	//Quest list
	var i=0;repeat(ds_height){
		var startx = window_x+15
		var starty = window_y+56+(23*i)
		var quest_struct = return_struct_from_quest_index_by_quest_id(obj_questmanager.ds_current_quests[| i][@ quest_data.name])
		var c = c_black
			if mouseover(startx-2,starty+2,startx+300,starty+21){
				c = c_blue
				if mouse_check_button_pressed(mb_left){
					selectedquest=quest_struct.quest_unlocale_name
				}
				if mouse_check_button_pressed(mb_right){
					with(obj_questmanager){
						tracking_quest=quest_struct.quest_unlocale_name
						quest_tracking_update(tracking_quest)
					}
				}
			}
			draw_text_color_fast(startx,starty,quest_struct.quest_locale_name,c,1)
		i++
	}
}else{//Draw selected quest
	draw_set_halign(fa_middle)
	draw_set_valign(fa_top)
	draw_set_color(c_black)
	var quest_struct = return_struct_from_quest_index_by_quest_id(selectedquest)
	var stage_array = get_current_quest_array(selectedquest)//Get array in current quest list
	var quest_progress = stage_array[@ quest_data.progress]//Quest Progress
	//Quest name
	draw_text(window_x+169,window_y+35,quest_struct.quest_locale_name)
	draw_set_halign(fa_left)
	//Quest description
	draw_text_ext(window_x+15,window_y+56+(24*(quest_progress+1)),quest_struct.quest_description,23,313)
	//Quest task list
	for(i=0;i<quest_progress+1;i++){
		var startx = window_x+15
		var starty = window_y+56
		var c = c_black
		draw_text_color_fast(startx+24,starty+(24*i),quest_struct.quest_short_tasks_description[i]/*+" "+quest_get_task_amount(quest_struct)*/,c,1)
		
		if i != quest_progress{
			draw_sprite(spr_task_done,1,startx,starty+(24*i))
		}
	}
	var bi = 0
	//Back to quest list button
	if mouseover(window_x+25,window_y+276,window_x+49,window_y+300){
		bi = 1
		if mouse_check_button_pressed(mb_left){
			selectedquest=undefined
		}
	}
	draw_sprite(spr_shift,bi,window_x+25,window_y+276)
	draw_text(window_x+52,window_y+276,backtoquestlistword)
}

