//We check the type of dialogue to see if it is 1) "normal" or 2) a player choice dialogue.

#region TYPE 0: NORMAL
if(type[page] == 0){
	if obj_inputManager.interact_key or mouse_check_button_released(mb_left){

		if element.get_typewriter_state() < 1{
			charCount = string_length(text_NE);
			element.typewriter_skip()
		}
		
		//Only increase page IF page + 1,is less than the total number of entries
		else if(page+1 < array_length(text)){
			event_perform(ev_other, ev_user0);
			switch(nextline[page]){
				case -1: instance_destroy();	exit;
				case  0: page += 1;io_clear()			break;
				default: page = nextline[page];
			}
			event_perform(ev_alarm, 0);
			
		} else { event_perform(ev_other, ev_user0); instance_destroy(); }
	}
} 
#endregion

#region TYPE 1: DIALOGUE CHOICE
else {
	if(chosen) exit;
	
	if timer > 0{
		timer -= 1*DELTATIME
	}

	if obj_inputManager.interact_key or mouse_check_button_released(mb_left) or timer == 0{ 
		chosen = true; 
		alarm[2] = 60 * DELTATIME; 
		audio_play_sound(select_snd_effect, priority_snd_effect, false);
	} 
	
	//Change Choice 
	var change_choice = obj_inputManager.dialogue_scroll_down - obj_inputManager.dialogue_scroll_up;
	if(change_choice != 0){ 
		choice += change_choice; 
		audio_play_sound(choice_snd_effect, priority_snd_effect, false); 
	}
	if (choice < 0) { choice = array_length(text[page])-1; }
	else if (choice > array_length(text[page])-1) { choice = 0; }
}
#endregion