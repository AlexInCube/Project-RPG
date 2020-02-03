enum menu_page{
	main,
	settings,
	audio,
	graphics,
	controls,
	interface,
	height
}

enum menu_element_type{
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

ds_menu_main = scr_create_menu_page(
	[scr_find_keyword("start_game"),	menu_element_type.script_runner, scr_game_start],
	[scr_find_keyword("continue_game"),	menu_element_type.script_runner, scr_continue_game],
	[scr_find_keyword("settings"),		menu_element_type.page_transfer, menu_page.settings],
	[scr_find_keyword("exit"),			menu_element_type.script_runner, scr_game_exit]
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
	["up",								menu_element_type.input, "key_up", global.key_up],
	["down",							menu_element_type.input, "key_down", global.key_down],
	[scr_find_keyword("back"),			menu_element_type.page_transfer, menu_page.settings]
)

ds_menu_interface = scr_create_menu_page(
	[scr_find_keyword("gui_size"),		menu_element_type.shift, scr_change_gui_size,global.guisize,[scr_find_keyword("gui_small"),scr_find_keyword("gui_standard"),scr_find_keyword("gui_large")]],
	[scr_find_keyword("language"),		menu_element_type.shift, scr_change_language,0,["russian","english"]],
	[scr_find_keyword("back"),			menu_element_type.page_transfer, menu_page.settings]
)

page = 0
menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls, ds_menu_interface]

var i=0, array_len = array_length_1d(menu_pages)
repeat(array_len){
	menu_option[i]=0
	i++
}

inputting=false