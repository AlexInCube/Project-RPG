draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_alpha(1)
//Draw textbox
draw_sprite(dialogue_box, 0, pos_x,pos_y-sprite_get_height(name_box));

//Draw portrait
draw_sprite(portrait_frame, 0, pos_x-portraitWidth, pos_y);
if(portrait[page] != -1){
	draw_sprite(portrait[page], emotion[page], pos_x-portraitWidth, pos_y);
	draw_sprite(portrait_frame, 1, pos_x-portraitWidth, pos_y);
}

#region Draw name and namebox
var cname = name[page]

if(cname != "None"){
	//Draw namebox
	draw_sprite(name_box, 0, name_box_x,name_box_y);
	
	//Draw name text
	scribble(cname)
	.align(fa_center, fa_top)
	.starting_format(name_font, name_col)
	.draw(name_box_text_x,name_box_text_y)
}
#endregion

//Set font
draw_set_font(font[page]);

//--------Draw the text differently if we are in 1) a dialogue choice or 2) normal dialogue
#region TYPE 1: DIALOGUE CHOICE
if(type[page] == 1){
	//Variables we need
	var col = default_col, tp = text[page], tpl = array_length(tp), txtwidth = boxWidth-(2);
	var cc = 1, yy = pos_y-23, xx = pos_x+5, ii = 0, iy = 0;
	
	var selected = false
	//Loop through our choices, draw them, highlight the one we are selecting
	repeat(tpl){
		if(choice == ii){ 
			if(chosen) {col = select_col;}
			else	   { col = choice_col; selected=true; }
		} else { col = c_black; selected=false}
		
		
		
		//Draw our choices
		var ctext = tp[ii];
		var rectangleoffset = 1
		if string_width(ctext)+2 > txtwidth {rectangleoffset++}
		if selected{
			scribble(ctext).align(fa_left,fa_top).starting_format(dialogue_font, "c_red").wrap(txtwidth).draw(xx,yy+((ii+iy)*stringHeight))
			//Draw choice border
			draw_set_color(c_red)
			draw_rectangle(xx-3,yy+((ii+iy)*stringHeight)+3,xx+txtwidth-8,yy+((ii+iy)*stringHeight)+(24*rectangleoffset),true)
		}else{
			scribble(ctext).align(fa_left,fa_top).starting_format(dialogue_font, "c_black").wrap(txtwidth).draw(xx,yy+((ii+iy)*stringHeight))
		}
		
		//Apply choice with mouse
		if mouseover(xx-3,yy+((ii+iy)*stringHeight)+3,xx+txtwidth-8,yy+((ii+iy)*stringHeight)+(24*rectangleoffset))
		{
			choice = ii
		}
		
		//If string width more than txtbox, increased iy
		if(string_width(ctext) > txtwidth) { iy++; }
		//increase string numbers
		ii++; 
		rectangleoffset = 1
	}
} 
#endregion

#region TYPE 0: NORMAL DIALOGUE
else {
	//---------------------------------Setup for Effects----------------------------//
	var col = default_col, cc = 1, yy = pos_y-23, xx = pos_x+5,txtwidth = boxWidth

	element = scribble(text_NE)
	element.align(fa_left,fa_top)
	element.starting_format(dialogue_font, "c_black")
	element.wrap(txtwidth)
	element.typewriter_in(0.5, 1)
	//element.typewriter_sound([voice[page]],1000,global.settings.audio.soundvolume,global.settings.audio.soundvolume)
	element.draw(xx,yy)
	//audio_play_sound(voice[page], 1, false)
	
	t += 1;
	var shift = sin(t*pi*2/60)*3;
	#region Draw "Finished" effect
	if element.get_typewriter_state() == 1{
		var shift = sin((t+cc)*pi*freq/60)*amplitude;
		finishede_count += finishede_spd;
		if(finishede_count >= finishede_num){ finishede_count = 0; }
		draw_sprite(finished_effect, finishede_count, finishede_x + shift*DELTATIME, finishede_y);
	}
	#endregion
}
#endregion