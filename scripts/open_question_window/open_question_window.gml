function open_question_window(width,height,question,yes_word,no_word,yes_scr,no_scr,yes_args,no_args){
	if !instance_exists(obj_question_window){
		with(instance_create_depth(0,0,-1000,obj_question_window)){
			window_x = GUIWIDTH/2 - width/2
			window_y = GUIHEIGHT/2 - height/2
			self.question = find_keyword(question)
			window_width = width
			window_height = height
			answer_yes = find_keyword(yes_word)
			answer_no = find_keyword(no_word)
			yes_script = yes_scr
			no_script = no_scr
			if !is_undefined(yes_args){
				yes_arg = yes_args
			}
			if !is_undefined(no_args){
				no_arg = no_args
			}
			str_width_yes = string_width(answer_yes)
			str_height_no = string_width(answer_no)
			event_user(0)
		}
	}
}