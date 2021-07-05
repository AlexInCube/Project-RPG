#region Quest List
var previous_quest_height = 0
var list_height = 0
if surface_exists(quest_list_surf)
{
	surface_set_target(quest_list_surf)
	draw_clear_alpha(c_white,0.5)
	//Draw quest list on surface
	var i=0;repeat(quest_list_ds_height)
	{
		var quest_struct = return_struct_from_quest_index_by_quest_id(obj_questmanager.ds_current_quests[| i][@ quest_data.name])
	
		var txt_height = 0
		//Prepare quest name
		var element_name = scribble(quest_struct.quest_locale_name).starting_format("fnt_small",c_white)
		//Prepare quest description
		var element_description = scribble(quest_struct.quest_description).starting_format("fnt_small",c_white).wrap(quest_list_button_width)
		txt_height += element_description.get_height()
		//Calculate true Y
		var yyy = (i*(quest_list_button_height+quest_list_button_offset_y))+previous_quest_height
		var yy = quest_list_scroll_y+yyy
	
		//Calculate mouse over for next calls
		var mouse_over = mouseover(quest_list_mouse_zone_x1+quest_list_start_x,quest_list_mouse_zone_y1+yy,quest_list_mouse_zone_x1+quest_list_start_x+quest_list_button_width,quest_list_mouse_zone_y1+yy+quest_list_button_height+txt_height)
		//Draw background
		if mouse_over{
			draw_set_alpha(0.5)
		}
		//If quest tracked, change background color
		var tracked = false
		if obj_questmanager.tracking_quest == quest_struct.quest_unlocale_name{
			tracked = true
		}
		//Draw background
		draw_sprite_stretched(quest_list_spr,tracked,quest_list_start_x,yy,quest_list_button_width,quest_list_button_height+txt_height)
		draw_set_alpha(1)
	
		//Draw quest name and short description
		element_name.draw(quest_list_start_x+quest_list_button_name_x,yy+quest_list_button_name_y)
		element_description.draw(quest_list_start_x+quest_list_button_decription_x,yy+quest_list_button_decription_y)
	
		//If mouse over quest
		if mouse_over{
			if mouse_check_button_pressed(mb_left) selected_quest = quest_struct.quest_unlocale_name
			if mouse_check_button_pressed(mb_right){
				if obj_questmanager.tracking_quest != quest_struct.quest_unlocale_name{
					quest_tracking_update(quest_struct.quest_unlocale_name)
				}else{
					obj_questmanager.tracking_quest = undefined
				}
			}
		}
	
		//Y offset for next quest
		previous_quest_height += txt_height
		list_height += yyy
		i++
	}
	//draw_rectangle_color_fast(quest_list_mouse_zone_x1,quest_list_mouse_zone_y1,quest_list_mouse_zone_x2,quest_list_mouse_zone_y2,c_white,false)
	surface_reset_target()
	draw_surface(quest_list_surf,quest_list_mouse_zone_x1,quest_list_mouse_zone_y1)
	//List Scrolling
	if mouseover(quest_list_mouse_zone_x1,quest_list_mouse_zone_y1,quest_list_mouse_zone_x2,quest_list_mouse_zone_y2){
		//var true_height = GUIHEIGHT - list_height //quest_list_mouse_zone_y2+mb_wheel_spd-list_height
		if mouse_wheel_up(){
			quest_list_scroll_y += mb_wheel_spd
		}else if mouse_wheel_down(){
			quest_list_scroll_y -= mb_wheel_spd
			
		}
		//quest_list_scroll_y = clamp(quest_list_scroll_y,true_height*-1,true_height)

		//draw_text_shadow(150,20,string(true_height),fnt_small,1,c_gray,c_white,1)
	}
}else{
	restore_surf_quest_list()
}
#endregion
//draw_set_halign(fa_left)
//draw_text_shadow(20,20,string(quest_list_scroll_y)+"   "+string(list_height),fnt_small,1,c_gray,c_white,1)
draw_set_color(c_white)
draw_line(line_1x,obj_gui_screen_controller.line_y,quest_list_button_width+2,GUIHEIGHT)

#region Quest Tasks
if !is_undefined(selected_quest){ 
	var quest_struct = return_struct_from_quest_index_by_quest_id(selected_quest)
	var stage_array = get_current_quest_array(selected_quest)//Get array in current quest list
	var arr_len = quest_get_task_amount(quest_struct)
	var quest_progress = stage_array[@ quest_data.progress]//Quest Progress
	

	var previous_quest_height = 0
	for(i=0;i<quest_progress+1;i++){
		var txtheight = 0
		var element_name = scribble(quest_struct.quest_short_tasks_description[arr_len-i]).starting_format("fnt_large",c_white)
		
		var element_description = scribble(quest_struct.quest_long_tasks_description[arr_len-i]).starting_format("fnt_small",c_white).wrap(tasks_button_width)
		txtheight += element_description.get_height()
		var yy = tasks_start_y+(i*(tasks_button_height+tasks_button_offset_y))+previous_quest_height
		var current = i == 0 ? false : true
		draw_sprite_stretched(tasks_spr,current,tasks_start_x,yy,tasks_button_width,txtheight+tasks_button_height+5)
		
		element_name.draw(tasks_start_x+tasks_button_name_x,yy+tasks_button_name_y)
		element_description.draw(tasks_start_x+tasks_button_description_x,yy+tasks_button_description_y)
		
		previous_quest_height += txtheight
	}
}
#endregion