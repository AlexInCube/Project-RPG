if mouse_check_button_side(mb_xbutton1){
	show_debug_message(mouse_check_button_side(mb_xbutton1))
}

if menustate == menu_state.main_buttons{
	ui_element_switch_lock_all(ds_menu_main,false)
}else{
	ui_element_switch_lock_all(ds_menu_main,true)
}