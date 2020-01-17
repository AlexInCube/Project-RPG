if obj_controller.interact_key
{
	if(!choice_dialogue and counter<str_len){counter=str_len}
	else if (page < array_length_1d(text) -1)
	{
		event_perform(ev_other, ev_user1)
		
		var line = next_line[page]
		if(choice_dialogue) line = line[choice]
		
		if(line == 0)page++
		else if (line == -1){instance_destroy(); exit}
		else page=line
		
		event_perform(ev_other, ev_user0)
	}
	else
	{
		instance_destroy()
		
	}
}

if(choice_dialogue)
{
	choice += obj_controller.down - obj_controller.up
	choice = clamp(choice,0,text_array_len-1)
}