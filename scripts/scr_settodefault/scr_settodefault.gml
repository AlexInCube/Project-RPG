function settodefault() {
	setup_default_settings()//Setup default struct

	with obj_optionswindow{//Apply all settings
		var ds_grid = ds_options
		ds_grid_destroy(ds_options)
		create_ds_grid_settings()
		var ds_height = ds_grid_height(ds_grid)
		for(i=0;i<ds_height-1;i++){
		switch(ds_grid[# 1,i]){
			case settings_element_type.toggle:
					script_execute(ds_grid[# 2,i],ds_grid[# 3,i])
			break;
			case settings_element_type.shift:
					script_execute(ds_grid[# 2,i],ds_grid[# 3,i])
			break;
			case settings_element_type.slider:
					script_execute(ds_grid[# 2,i],i,ds_grid[# 3,i])
			break;
			case settings_element_type.input:
					variable_global_set(ds_grid[# 2,i], ds_grid[# 3, i])
			break;
		}
	}
	}
	
	open_settings()//Destroy settings window
	open_settings()//Open Settings Window
}
