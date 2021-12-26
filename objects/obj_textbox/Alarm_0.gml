///@description Setup
//Must be done AFTER the handover occurs, so frame after created, and after every text page change

#region Reset variables
charCount		= 0;
finishede_count = 0;
text_speed_c	= 0;
audio_c			= 0;
charCount_f		= 0;
timer			= 0;

if(portrait[page] == -1){
	pos_x			= (gb_diff/2);
	
} else {
	pos_x			= (gb_diff/2)+(portraitWidth/2);
	
}

charSize = 10
#endregion

#region GET THE BREAKPOINTS AND TEXT EFFECTS
//Again only need to do this if our CURRENT page is "normal". Separated from above for readability.
timer_max = time[page]
timer = timer_max

if(type[page] == 0){
	var s = type[page]
	text_NE = find_keyword(text[page]); 
	str_len = string_length(text_NE);

	
	//Get variables ready
	var by = 0,cc = 1, breakpoint = 0;
	var next_space = 0, char, txtwidth = boxWidth-(2)

	//Reset the text effects and breakpoints arrays
	breakpoints = -1;
	
	//Loop through and save the effect positions and breakpoints
	repeat(str_len){
		//Save Effect Positions
		char = string_char_at(text[page], cc);
		
		//Get next space, deal with new lines
		if(cc >= next_space){
			next_space = cc;
			while(next_space < str_len and string_copy(text_NE, next_space,1) != " ") next_space++;
			var linewidth = (next_space-breakpoint)*charSize;
			if (linewidth >= txtwidth) { breakpoint = cc; breakpoints[by] = cc; by++; } 
		}
	
		cc++;
	}
}
#endregion
