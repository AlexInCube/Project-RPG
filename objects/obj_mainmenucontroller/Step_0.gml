input_up_p = keyboard_check_pressed(ord("W"))
input_down_p = keyboard_check_pressed(ord("S"))
input_enter_p = keyboard_check_pressed(vk_enter)



var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid)

if (inputting){
	var hinput_slider = keyboard_check(ord("D")) - keyboard_check(ord("A"))
	var hinput_other = keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"))
	switch(ds_grid[# 1, menu_option[page]]){
		case menu_element_type.shift:
			
			if(hinput_other !=0){
				ds_grid[# 3,menu_option[page]] += hinput_other
				ds_grid[# 3,menu_option[page]] = clamp(ds_grid[# 3,menu_option[page]],0,array_length_1d(ds_grid[# 4,menu_option[page]])-1)
			}
		break
		case menu_element_type.slider:
			
			if(hinput_slider !=0){
				ds_grid[# 3,menu_option[page]] += hinput_slider*0.01
				ds_grid[# 3,menu_option[page]] = clamp(ds_grid[# 3,menu_option[page]],0,1)
			}
			script_execute(ds_grid[# 2,menu_option[page]],ds_grid[# 3, menu_option[page]])
		break
		case menu_element_type.toggle:
		
			if(hinput_other !=0){
				ds_grid[# 3,menu_option[page]] += hinput_other
				ds_grid[# 3,menu_option[page]] = clamp(ds_grid[# 3,menu_option[page]],0,1)
			}
		break
		case menu_element_type.input:
		var kk = keyboard_lastkey
		if(kk != vk_enter){
			if (kk != ds_grid[# 3,menu_option[page]])
			ds_grid[# 3, menu_option[page]] = kk
			variable_global_set(ds_grid[# 2,menu_option[page]], kk)
		}
		break
	}
}else{
	var ochange = input_down_p - input_up_p
	if(ochange !=0){
		menu_option[page] += ochange
		if(menu_option[page] > ds_height-1){menu_option[page] = 0}
		if(menu_option[page] < 0){menu_option[page] = ds_height-1}
	}
	
}

if input_enter_p{
	event_perform(ev_other,ev_user0)
}