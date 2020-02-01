/// @description Insert description here
// You can write your code in this editor
ini_open("game_settings.ini")
global.mastervolume=		ini_read_real("settings", "mastervolume", 0.5)
global.musicvolume=			ini_read_real("settings", "musicvolume", 0.5)
global.soundvolume=			ini_read_real("settings", "soundvolume", 0.5)
global.fullscreen=			ini_read_real("settings", "fullscreen", 0)
global.width=				ini_read_real("settings", "width", 1280)
global.height=				ini_read_real("settings", "height", 720)
global.guisize=				ini_read_real("settings", "guisize", 1)
global.language=			ini_read_string("settings", "language", "russian")

global.key_up =				ini_read_real("keys","key_up",ord("W"))				
global.key_left =			ini_read_real("keys","key_left",ord("A"))
global.key_right =			ini_read_real("keys","key_right",ord("D"))
global.key_down =			ini_read_real("keys","key_down",ord("S"))



global.inventory_hotkey1 =	ini_read_real("keys","inventory_hotkey1",ord("1"))
global.inventory_hotkey2 =	ini_read_real("keys","inventory_hotkey2",ord("2"))
global.inventory_hotkey3 =	ini_read_real("keys","inventory_hotkey3",ord("3"))
global.inventory_hotkey4 =	ini_read_real("keys","inventory_hotkey4",ord("4"))
global.inventory_hotkey5 =	ini_read_real("keys","inventory_hotkey5",ord("5"))
global.inventory_hotkey6 =	ini_read_real("keys","inventory_hotkey6",ord("6"))
global.inventory_hotkey7 =	ini_read_real("keys","inventory_hotkey7",ord("7"))
global.inventory_hotkey8 =	ini_read_real("keys","inventory_hotkey8",ord("8"))
global.inventory_hotkey9 =	ini_read_real("keys","inventory_hotkey9",ord("9"))
global.inventory_hotkey10 =	ini_read_real("keys","inventory_hotkey10",ord("0"))

global.pickup_key =			ini_read_real("keys","pickup_key",vk_space)
global.interact_key =		ini_read_real("keys","interact_key",ord("E"))
global.attack_key =			ini_read_real("keys","attack_key",ord("V"))
global.skillbook_key =		ord("O")
global.inventory_key =		ini_read_real("keys","inventory_key",ord("I"))
global.drop_item_key =		ini_read_real("keys","drop_item_key",ord("Q"))
global.combination_key =	ini_read_real("keys","combination_key",vk_control)
global.pause_key =			ini_read_real("keys","pause_key",vk_escape)

global.developer_key =		ini_read_real("keys","developer_key",vk_f5)
ini_close()

view_enabled=true;
view_visible[0]=true;
camera = camera_create();
view_camera[0]=camera;



camera_set_view_size(view_camera[0],global.width,global.height);
surface_resize(application_surface, global.width, global.height);
display_set_gui_size(global.width, global.height)
window_set_size(global.width,global.height)


scr_localizationload()


draw_set_font(fnt_main)
alarm[0]=1
