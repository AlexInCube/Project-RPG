// Inherit the parent event
draw_set_font(fnt_small)

draw_sprite(window_sprite,0,window_x,window_y-22)

var ds_height = ds_grid_height(obj_questmanager.ds_quests)

//Draw quest list
if selectedquest==noone{
	draw_set_halign(fa_middle)
	draw_set_valign(fa_top)
	draw_set_color(c_black)
	draw_text(window_x+169,window_y+35,window_name)
	draw_set_halign(fa_left)
	//Quest list
	var i=0;repeat(ds_height){
		if quest_get_current_stage(i)> -1{
			var startx = window_x+15
			var starty = window_y+56+(23*i)
			var c = c_black
			if mouseover(startx-2,starty+2,startx+300,starty+21){
				c = c_blue
				if mouse_check_button_pressed(mb_left){
					selectedquest=i
				}
				if mouse_check_button_pressed(mb_right){
					with(obj_questmanager){
						tracking_quest=i
						quest_tracking_update(tracking_quest)
					}
				}
			}
			draw_text_color(startx,starty,string(quest_get_name(i)),c,c,c,c,1)
			/*
			draw_text_color(startx,starty,string(quest_get_name(i))+":"
			+string(quest_get_current_stage(i))+"/"+string(quest_get_task_amount(i)+1),c,c,c,c,1)
			*/
		}
		i++
	}
}else{//Draw selected quest
	draw_set_halign(fa_middle)
	draw_set_valign(fa_top)
	draw_set_color(c_black)
	//Quest name
	draw_text(window_x+169,window_y+35,quest_get_name(selectedquest))
	draw_set_halign(fa_left)
	//Quest description
	draw_text_ext(window_x+15,window_y+56+(24*(quest_get_current_stage(selectedquest)+1)),quest_get_description(selectedquest),23,313)
	//Quest task list
	for(i=0;i<quest_get_current_stage(selectedquest)+1;i++){
		var startx = window_x+15
		var starty = window_y+56
		var c = c_black
		var taskarray = quest_get_tasks_array(selectedquest)
		draw_text_color(startx+24,starty+(24*i),taskarray[i]+" "+quest_return_progress_string(selectedquest),c,c,c,c,1)
		if i != quest_get_current_stage(selectedquest){
		draw_sprite(spr_task_done,1,startx,starty+(24*i))
		}
	}
	var bi = 0
	//Back to quest list button
	if mouseover(window_x+25,window_y+276,window_x+49,window_y+300){
		bi = 1
		if mouse_check_button_pressed(mb_left){
			selectedquest=noone
		}
	}
	draw_sprite(spr_shift,bi,window_x+25,window_y+276)
	draw_text(window_x+52,window_y+276,backtoquestlistword)
}

