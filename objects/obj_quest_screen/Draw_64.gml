#region Quest List
var previous_quest_height = 0
var i=0;repeat(quest_list_ds_height){
	var quest_struct = return_struct_from_quest_index_by_quest_id(obj_questmanager.ds_current_quests[| i][@ quest_data.name])
	
	var txt_height = 0
	//Prepare quest name
	var element_name = scribble(quest_struct.quest_locale_name).starting_format("fnt_small",c_white)
	//Prepare quest description
	var element_description = scribble(quest_struct.quest_description).starting_format("fnt_small",c_white).wrap(quest_list_button_width)
	txt_height += element_description.get_height()
	var yy = quest_list_start_y+(i*(quest_list_button_height+quest_list_button_offset_y))+previous_quest_height
	
	draw_sprite_stretched(quest_list_spr,0,quest_list_start_x,yy,quest_list_button_width,quest_list_button_height+txt_height)
	
	element_name.draw(quest_list_start_x+quest_list_button_name_x,yy+quest_list_button_name_y)
	element_description.draw(quest_list_start_x+quest_list_button_decription_x,yy+quest_list_button_decription_y)
	
	if mouseover(quest_list_start_x,yy,quest_list_start_x+quest_list_button_width,yy+quest_list_button_height+txt_height){
		if mouse_check_button_pressed(mb_left) selected_quest = quest_struct.quest_unlocale_name
	}
	
	
	previous_quest_height += txt_height
	i++
}
#endregion

draw_set_color(c_white)
draw_line(line_1x,obj_gui_screen_controller.line_y,quest_list_button_width,GUIHEIGHT)

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
		draw_sprite_stretched(tasks_spr,0,tasks_start_x,yy,tasks_button_width,txtheight+tasks_button_height+5)
		
		element_name.draw(tasks_start_x+tasks_button_name_x,yy+tasks_button_name_y)
		element_description.draw(tasks_start_x+tasks_button_description_x,yy+tasks_button_description_y)
		
		previous_quest_height += txtheight
	}
}
#endregion