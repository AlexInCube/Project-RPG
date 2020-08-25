function scr_change_resolution(argument0) {
	var resolution_array = ds_options[# 4,5]
	var need_res = resolution_array[argument0]
	var str_w = ""
	var str_h = ""
	var mode = 0
	for(var i=1;i<string_width(need_res);i++){
		var char = string_char_at(need_res,i)
		
		if char == "x"{
			mode = 1
			continue
		}
		switch(mode){
			case 0: str_w = string_insert(char,str_w,string_width(str_w)-1) break
			case 1: str_h = string_insert(char,str_h,string_width(str_h)-1) break
		}
	}
	global.width=real(str_w)
	global.height=real(str_h)
	window_set_size(global.width,global.height)
	scr_change_gui_size(global.guisize)
	surface_resize(application_surface,global.width,global.height);
	alarm[0]=1

	GUIWIDTH=display_get_gui_width()
	GUIHEIGHT=display_get_gui_height()
}
