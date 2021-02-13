depth =-100
ds_saves = ds_list_create()//Contain saves name folder
saving = false//if false, show only load and delete buttons. if true, show also save button.

drawelementstart = 0//Start drawing ds_list from position
drawelementheight = round((GUIHEIGHT-20)/(sprite_get_height(spr_save_slot)+21))-1

ss_w = GUIHEIGHT-20
ss_h = sprite_get_height(spr_save_slot)+16

window_name=find_keyword("save_window")
gameversion_word = find_keyword("game_version")
savetime_word = find_keyword("save_time")


//Update saves list
function create_saves_list(){
	//Reload Save List
	if ds_exists(ds_saves,ds_type_list){
		ds_list_destroy(ds_saves)
		ds_saves = ds_list_create()
	}else{
		ds_saves = ds_list_create()
	}
    var file = file_find_first("Saves\\*",fa_directory)
	while(file != ""){
		if file_exists("Saves\\"+file+"/playerdata.txt"){
			var file_path = "Saves\\"+file+"\\"+"playerdata.txt"
			var file_ = file_text_open_read(file_path)
			var save_string = file_text_read_string(file_)
			file_text_close(file_)
			var save_data = json_parse(save_string)
			var c_array = save_data.saving_time
			
			ds_list_add(ds_saves,[file,c_array,save_data.game_version])	
		}

		file = file_find_next();
	}
	file_find_close()
	
	ds_size = ds_list_size(ds_saves)
}

create_saves_list()

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
