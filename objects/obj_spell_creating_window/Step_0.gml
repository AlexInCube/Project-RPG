if txt_box_selected{
	if (string_length(keyboard_string)<char_limit) 
	    spell_data.spell_name = keyboard_string;
	else
	    keyboard_string = spell_data.spell_name;
}

if keyboard_check_pressed(vk_delete){
	spell_data.spell_grid[# selected_slot[0],selected_slot[1]] = -1
}

if keyboard_check(vk_control){
	if keyboard_check(vk_shift){
		if keyboard_check_pressed(vk_delete){
			ds_grid_clear(spell_data.spell_grid,-1)
		}
	}
	
	if keyboard_check_pressed(vk_left){
		ds_grid_translate(spell_data.spell_grid,-1,0)
	}
	
	if keyboard_check_pressed(vk_right){
		ds_grid_translate(spell_data.spell_grid,1,0)
	}
	
	if keyboard_check_pressed(vk_up){
		ds_grid_translate(spell_data.spell_grid,0,-1)
	}
	
	if keyboard_check_pressed(vk_down){
		ds_grid_translate(spell_data.spell_grid,0,1)
	}
}