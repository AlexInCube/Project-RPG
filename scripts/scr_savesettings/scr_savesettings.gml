var ds_grid = obj_optionswindow.ds_options
var ds_height = ds_grid_height(ds_grid)
for(i=0;i<ds_height-1;i++){
	switch(ds_grid[# 1,i]){
		case menu_element_type.toggle:
			if ds_grid[# 4,i] == 0{
				script_execute(ds_grid[# 2,i],ds_grid[# 3,i])
			}
		break;
		case menu_element_type.shift:
			if ds_grid[# 5,i] == 0{
				script_execute(ds_grid[# 2,i],ds_grid[# 3,i])
			}
		break;
		case menu_element_type.slider:
			if ds_grid[# 5,i] == 0{
				script_execute(ds_grid[# 2,i],i,ds_grid[# 3,i])
			}
		break;
		case menu_element_type.input:
			if ds_grid[# 4,i] == 0{
				variable_global_set(ds_grid[# 2,i], ds_grid[# 3, i])
			}
		break;
	}
}


ini_open("game_settings.ini")
ini_write_real("Sounds", "soundvolume", global.soundvolume)
ini_write_real("Sounds", "musicvolume", global.musicvolume)
ini_write_real("Sounds", "mastervolume", global.mastervolume)
ini_write_real("Graphics", "width", global.width)
ini_write_real("Graphics", "height", global.height)
ini_write_real("Interface", "guisize", global.guisize)
ini_write_real("Interface", "fullscreen", global.fullscreen)
ini_write_real("Interface", "show_damage", global.showdamage)
ini_write_string("Interface","language",global.language)
ini_write_real("Keys","key_up",global.key_up)
ini_write_real("Keys","key_down",global.key_down)
ini_write_real("Keys","key_left",global.key_left)
ini_write_real("Keys","key_right",global.key_right)
ini_write_real("Keys","inventory_hotkey1",global.inventory_hotkey1)
ini_write_real("Keys","inventory_hotkey2",global.inventory_hotkey2)
ini_write_real("Keys","inventory_hotkey3",global.inventory_hotkey3)
ini_write_real("Keys","inventory_hotkey4",global.inventory_hotkey4)
ini_write_real("Keys","inventory_hotkey5",global.inventory_hotkey5)
ini_write_real("Keys","inventory_hotkey6",global.inventory_hotkey6)
ini_write_real("Keys","inventory_hotkey7",global.inventory_hotkey7)
ini_write_real("Keys","inventory_hotkey8",global.inventory_hotkey8)
ini_write_real("Keys","inventory_hotkey9",global.inventory_hotkey9)
ini_write_real("Keys","inventory_hotkey10",global.inventory_hotkey10)
ini_write_real("Keys","pickup_key",global.pickup_key)
ini_write_real("Keys","interact_key",global.interact_key)
ini_write_real("Keys","attack_key",global.attack_key)
ini_write_real("Keys","inventory_key",global.inventory_key)
ini_write_real("Keys","drop_item_key",global.drop_item_key)
ini_write_real("Keys","combination_key",global.combination_key)
ini_write_real("Keys","pause_key",global.pause_key)
ini_write_real("Keys","developer_key",global.developer_key)
ini_close()