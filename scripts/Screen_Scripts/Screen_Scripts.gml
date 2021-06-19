function add_screen(screen_id,screen_ico,screen_obj){
	ds_map_add(obj_gui_screen_controller.screen_map,screen_id,{
		screen_name : find_keyword(screen_id),
		screen_icon : screen_ico,
		screen_gui_obj : screen_obj,
	})
}

function create_screen_obj(screen_id){
	return instance_create_depth(0,0,-50,obj_gui_screen_controller.screen_map[? screen_id][$ "screen_gui_obj"])
}

function open_screen(screen_id){
	global.interface_lock_by_game = true
	with(obj_gui_screen_controller){
		active_screen = true
		current_screen = screen_id
		current_obj_screen = create_screen_obj(current_screen)
	}
}

function close_screen(){
	if obj_gui_screen_controller.active_screen{
		global.interface_lock_by_game = false
		obj_gui_screen_controller.active_screen = false
		instance_destroy(par_screen)
		current_obj_screen = noone
	}
}