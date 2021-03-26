window_x = 0
window_y = 0
window_width = 450
window_height = 200
window_sprite=spr_question_window
question = "question"
answer_yes = "yes"
answer_no = "no"
write_save_name = find_keyword("write_your_save_name")
save_name_must_be_longer = find_keyword("save_name_must_be_longer")


function destroy_me(){
	with(obj_game_start_window){
		instance_destroy()
	}
}

function check_save_files() {
	with(obj_game_start_window){
		if string_length(obj_ui_textbox.txt) <= 0 exit
		var file = file_find_first("Saves\\*",fa_directory)
		while(file != ""){
			if file == obj_ui_textbox.txt{
				ui_element_switch_lock_all(ds_elements,true)
				open_question_window(300,200,find_keyword("save_exists"),find_keyword("yes"),find_keyword("no"),method_get_index(game_start),nothing)
				file_find_close()
				exit
			}
			file = file_find_next();
		}
		file_find_close()
	
		game_start()
	}
}

function game_start(){
	if file_exists("Saves\\"+obj_ui_textbox.txt){
		file_delete("Saves\\"+obj_ui_textbox.txt)
	}
	global.directory_save = obj_ui_textbox.txt

	with(obj_game_start_window){
		instance_destroy()
	}	
	room_goto(room_game_init)
	global.load_state = load_state.new_game
}