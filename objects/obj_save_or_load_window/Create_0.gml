depth =-100
ds_saves = ds_list_create()//Contain saves name folder
create_saves_list()
saving = false//if false, show only load and delete buttons. if true, show also save button.

drawelementstart = 0//Start drawing ds_list from position
drawelementheight = round((GUIHEIGHT-20)/(sprite_get_height(spr_save_slot)+21))-1

ss_w = GUIHEIGHT-20
ss_h = sprite_get_height(spr_save_slot)+16

createslot_word = find_keyword("create_new_save_slot")
write_your_save_name_word = find_keyword("write_your_save_name")

function resaving(save_name){
	global.directory_save = save_name
	resume_game()//resume game for saving (activate all instances)
	save_game()
}

function rename(save_name){
	var new_name = get_string(write_your_save_name_word,save_name)
	if directory_exists("Saves\\"+save_name){
		file_copy_dir("Saves\\"+save_name,"Saves\\"+new_name,fa_directory)
		directory_destroy("Saves\\"+save_name)
		create_saves_list()
	}
}

function load(save_name){
	global.directory_save = save_name
	global.lastsave = global.directory_save
	start_load()
}

function _delete(save_name){
	directory_destroy("Saves\\"+save_name)
	show_debug_message("[Save Manager] Save deleted: "+save_name)
	create_saves_list()
	drawelementstart = clamp(drawelementstart,0,max(0,ds_size-drawelementheight))
}
	
function button(xx,yy,_sprite,_method,save_name){
	//show_debug_message("debugbutton: "+argument4)
	draw_sprite(_sprite,0,xx,yy)
	if mouseover(xx,yy,xx+32,yy+32){
		if mouse_check_button_pressed(mb_left){
			_method(save_name)
			return true
		}
	}
	return false
}
