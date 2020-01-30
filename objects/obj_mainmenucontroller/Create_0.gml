global.key_up =					ord("W")
global.key_left =				ord("A")
global.key_right =				ord("D")
global.key_down =				ord("S")

global.dialogue_scroll_up=		ord("W")
global.dialogue_scroll_down=	ord("S")

global.inventory_hotkey1 =		ord("1")
global.inventory_hotkey2 =		ord("2")
global.inventory_hotkey3 =		ord("3")
global.inventory_hotkey4 =		ord("4")
global.inventory_hotkey5 =		ord("5")
global.inventory_hotkey6 =		ord("6")
global.inventory_hotkey7 =		ord("7")
global.inventory_hotkey8 =		ord("8")
global.inventory_hotkey9 =		ord("9")
global.inventory_hotkey10 =		ord("0")

global.pickup_key =				vk_space
global.interact_key =			ord("E")
global.attack_key =				ord("V")
global.skillbook_key =			ord("O")
global.inventory_key =			ord("I")
global.drop_item_key =			ord("Q")
global.combination_key =		vk_control
global.pause_key =				vk_escape

global.developer_key =			vk_f5

camera_set_view_size(view_camera[0],global.width,global.height);
surface_resize(application_surface, global.width, global.height);
display_set_gui_size(global.width, global.height)

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
	["start_game",		menu_element_type.script_runner, scr_game_start],
	["continue_game",	menu_element_type.script_runner, scr_continue_game],
	["settings",		menu_element_type.page_transfer, menu_page.settings],
	["exit",			menu_element_type.script_runner, scr_game_exit]
)

ds_menu_settings = scr_create_menu_page(
	["audio",			menu_element_type.page_transfer, menu_page.audio],
	["graphics",		menu_element_type.page_transfer, menu_page.graphics],
	["controls",		menu_element_type.page_transfer, menu_page.controls],
	["interface",		menu_element_type.page_transfer, menu_page.interface],
	["back",			menu_element_type.page_transfer, menu_page.main]
)

ds_menu_audio = scr_create_menu_page(
	["master",			menu_element_type.slider, scr_change_volume,global.mastervolume,[0,1]],
	["music",			menu_element_type.slider, scr_change_volume,global.musicvolume,[0,1]],
	["sounds",			menu_element_type.slider, scr_change_volume,global.soundvolume,[0,1]],
	["back",			menu_element_type.page_transfer, menu_page.main]
)

ds_menu_graphics = scr_create_menu_page(
	["resolution",		menu_element_type.shift, scr_change_resolution,0,["1280x720","1536x874","1920x1080"]],
	["window_mode",		menu_element_type.toggle, scr_change_window_mode,global.fullscreen,["WINDOWED","FULLSCREEN"]],
	["back",			menu_element_type.page_transfer, menu_page.main]
)

ds_menu_controls = scr_create_menu_page(
	["up",				menu_element_type.input, "key_up", global.key_up],
	["down",			menu_element_type.input, "key_down", global.key_down],
	["back",			menu_element_type.page_transfer, menu_page.main]
)

ds_menu_interface = scr_create_menu_page(
	["gui_size",		menu_element_type.shift, scr_change_gui_size,global.guisize,["small","standard","big"]],
	["back",			menu_element_type.page_transfer, menu_page.main]
)

page = 0
menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls, ds_menu_interface]

var i=0, array_len = array_length_1d(menu_pages)
repeat(array_len){
	menu_option[i]=0
	i++
}

inputting=false