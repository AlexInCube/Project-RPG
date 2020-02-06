ds_menu_main = scr_create_menu_page(
	[scr_find_keyword("continue_game"),			menu_element_type.script_runner, scr_resume_game],
	[scr_find_keyword("save_game"),				menu_element_type.script_runner, scr_savegame],
	[scr_find_keyword("load_game"),				menu_element_type.script_runner, scr_loadgame],
	[scr_find_keyword("settings"),				menu_element_type.page_transfer, menu_page.settings],
	[scr_find_keyword("back_to_mainmenu"),		menu_element_type.script_runner, scr_back_to_mainmenu]
)

ds_menu_settings = scr_create_menu_page(
	[scr_find_keyword("audio_settings"),		menu_element_type.page_transfer, menu_page.audio],
	[scr_find_keyword("graphics_settings"),		menu_element_type.page_transfer, menu_page.graphics],
	[scr_find_keyword("controls_settings"),		menu_element_type.page_transfer, menu_page.controls],
	[scr_find_keyword("interface_settings"),	menu_element_type.page_transfer, menu_page.interface],
	[scr_find_keyword("back"),					menu_element_type.page_transfer, menu_page.main]
)

ds_menu_audio = scr_create_menu_page(
	[scr_find_keyword("master_volume"),		menu_element_type.slider, scr_change_volume,global.mastervolume,[0,1]],
	[scr_find_keyword("music_volume"),		menu_element_type.slider, scr_change_volume,global.musicvolume,[0,1]],
	[scr_find_keyword("sound_volume"),		menu_element_type.slider, scr_change_volume,global.soundvolume,[0,1]],
	[scr_find_keyword("back"),				menu_element_type.page_transfer, menu_page.settings]
)

ds_menu_graphics = scr_create_menu_page(
	[scr_find_keyword("resolution"),	menu_element_type.shift, scr_change_resolution,0,["1280x720","1536x874","1920x1080"]],
	[scr_find_keyword("window_mode"),	menu_element_type.toggle, scr_change_window_mode,global.fullscreen,["WINDOWED","FULLSCREEN"]],
	[scr_find_keyword("back"),			menu_element_type.page_transfer, menu_page.settings]
)

ds_menu_controls = scr_create_menu_page(
	["up",								menu_element_type.input, "key_up",					 global.key_up],
	["down",							menu_element_type.input, "key_down",			   global.key_down],
	["left",							menu_element_type.input, "key_left",		   	   global.key_left],
	["right",							menu_element_type.input, "key_right",			  global.key_right],
	["drop_item_key",					menu_element_type.input, "drop_item_key",	  global.drop_item_key],
	["attack_key",						menu_element_type.input, "attack_key",			 global.attack_key],
	["interact_key",					menu_element_type.input, "interact_key",	   global.interact_key],
	["pickup_key",						menu_element_type.input, "pickup_key",			 global.pickup_key],
	["combination_key",					menu_element_type.input, "combination_key", global.combination_key],
	[scr_find_keyword("next"),			menu_element_type.page_transfer, menu_page.controls_inventory],
	[scr_find_keyword("back"),			menu_element_type.page_transfer, menu_page.settings]
)

ds_menu_controls_inventory = scr_create_menu_page(
	["inventory_key",					menu_element_type.input, "inventory_key",	  global.inventory_key],
	["inventory_hotkey1",				menu_element_type.input, "inventory_hotkey1", global.inventory_hotkey1],
	["inventory_hotkey2",				menu_element_type.input, "inventory_hotkey2", global.inventory_hotkey2],
	["inventory_hotkey3",				menu_element_type.input, "inventory_hotkey3", global.inventory_hotkey3],
	["inventory_hotkey4",				menu_element_type.input, "inventory_hotkey4", global.inventory_hotkey4],
	["inventory_hotkey5",				menu_element_type.input, "inventory_hotkey5", global.inventory_hotkey5],
	["inventory_hotkey6",				menu_element_type.input, "inventory_hotkey6", global.inventory_hotkey6],
	["inventory_hotkey7",				menu_element_type.input, "inventory_hotkey7", global.inventory_hotkey7],
	["inventory_hotkey8",				menu_element_type.input, "inventory_hotkey8", global.inventory_hotkey8],
	["inventory_hotkey9",				menu_element_type.input, "inventory_hotkey9", global.inventory_hotkey9],
	["inventory_hotkey10",				menu_element_type.input, "inventory_hotkey10", global.inventory_hotkey10],
	[scr_find_keyword("back"),			menu_element_type.page_transfer, menu_page.controls]
)

ds_menu_interface = scr_create_menu_page(
	[scr_find_keyword("gui_size"),		menu_element_type.shift, scr_change_gui_size,global.guisize,[scr_find_keyword("gui_small"),scr_find_keyword("gui_standard"),scr_find_keyword("gui_large")]],
	[scr_find_keyword("back"),			menu_element_type.page_transfer, menu_page.settings]
)

page = 0
menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls, ds_menu_controls_inventory, ds_menu_interface]

var i=0, array_len = array_length_1d(menu_pages)
repeat(array_len){
	menu_option[i]=0
	i++
}

inputting=false