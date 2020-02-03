var ds_grid = menu_pages[page]


switch(ds_grid[# 1, menu_option[page]]){
		case menu_element_type.script_runner: script_execute(ds_grid[# 2, menu_option[page]]) break;
		case menu_element_type.page_transfer: page = ds_grid[# 2, menu_option[page]];break
		case menu_element_type.shift: 
		case menu_element_type.slider:
		case menu_element_type.toggle:	if(inputting){script_execute(ds_grid[# 2,menu_option[page]],ds_grid[# 3, menu_option[page]])}
		case menu_element_type.input:
		inputting = !inputting
		break
	}