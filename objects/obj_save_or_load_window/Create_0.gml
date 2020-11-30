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

function get_formatted_date(number){
	number = string(number)
	if string_length(number) == 1{
		return string(0)+number
	}else{
		return number
	}
}

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
	global.settings.lastsave = global.directory_save
	start_load()
}

function _delete(save_name){
	directory_destroy("Saves\\"+save_name)
	show_debug_message("[Save Manager] Save deleted: "+save_name)
	create_saves_list()
	drawelementstart = clamp(drawelementstart,0,max(0,ds_size-drawelementheight))
}

///@function file_copy_dir(source, target, attributes)
function file_copy_dir(){
// Copies contents from source directory to target directory.
// Add fa_directory to attributes for recursive copying.
var fname, i, file, files, from, to;
// create directory if it doesn't exist yet:
if (!directory_exists(argument1)) directory_create(argument1)
// push matching files into array:
// (has to be done separately due to possible recursion)
files = 0
for (fname = file_find_first(argument0 + "/*.*", argument2); fname != ""; fname = file_find_next()) {
    // don't include current/parent directory "matches":
    if (fname == ".") continue
    if (fname == "..") continue
    // push file into array
    file[files] = fname
    files += 1
}
file_find_close()
// process found files:
i = 0
repeat (files) {
    fname = file[i]
    i += 1
    from = argument0 + "/" + fname
    to = argument1 + "/" + fname
    if directory_exists(from) { // note: in GM:S+, prefer directory_exists(from)
        file_copy_dir(from, to, argument2) // recursively copy directories
    } else {
        file_copy(from, to) // copy files as normal
    }
}
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
