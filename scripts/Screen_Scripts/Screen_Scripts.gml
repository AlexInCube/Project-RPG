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
		create_screen_obj(current_screen)
	}
}

function close_screen(){
	global.interface_lock_by_game = false
	obj_gui_screen_controller.active_screen = false
	instance_destroy(par_screen)
}

function screen_draw_outline(xx,yy,w,h,txt){
	draw_sprite_stretched(spr_gui_inventory_outline,0,xx-16,yy-16,w+32,h+32)
	draw_set_alpha(1)
	draw_set_font(fnt_large)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_text(xx+16,yy-12,txt)
}

#region GUI Open
function open_inventory() {
	if !obj_gui_screen_controller.active_screen{
		open_screen(SCREEN_INVENTORY)
	}else{
		close_screen()
	}
}

function open_quest_list() {
	if !obj_gui_screen_controller.active_screen{
		open_screen(SCREEN_QUEST_LIST)
	}else{
		close_screen()
	}
}
#endregion