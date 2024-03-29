window_x = 0
window_y = 0
window_width = 450
window_height = 200
window_sprite=spr_question_window
question = "question"
answer_yes = find_keyword("start_game")
answer_no = find_keyword("cancel")
write_save_name = find_keyword("write_your_save_name")
save_name_must_be_longer = find_keyword("save_name_must_be_longer")
save_with_this_name_exists = find_keyword("save_with_this_name_exists")
warning_message = ""

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
				warning_message = save_with_this_name_exists
				file_find_close()
				exit
			}
			file = file_find_next();
		}
		file_find_close()
		ui_element_switch_lock_all(ds_elements,true)
		game_start()
	}
}

function game_start(){
	ui_element_switch_lock_all(obj_game_start_window.ds_elements,true)
	alarm[0]=100/DELTATIME
	create_transition(transition.fade_in)
}
