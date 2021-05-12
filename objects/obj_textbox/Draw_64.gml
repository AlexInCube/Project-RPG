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
		} else { col = default_col; selected=false}
		
		
		
		//Draw our choices
		var ctext = tp[ii];
		var rectangleoffset = 1
		if string_width(ctext)+2 > txtwidth {rectangleoffset++}
		element = scribble(ctext)
		element.align(fa_left,fa_top)
		element.starting_format(dialogue_font, col)
		element.wrap(txtwidth)
		element.draw(xx,yy+(iy*stringHeight))

		
		var box_struct = element.get_bbox()
		if selected{	
			draw_rectangle_color_fast(xx-3,yy+3+(iy*stringHeight)+box_struct.top,xx+txtwidth-8,yy+(iy*stringHeight)+box_struct.bottom+10,choice_col,true)
		}
		
							
		//Apply choice with mouse
		if mouseover(xx-3,yy+3+(iy*stringHeight)+box_struct.top,xx+txtwidth-8,yy+(iy*stringHeight)+box_struct.bottom)
		{
			choice = ii
		}
		
		iy += element.get_line_count(0)
		//increase string numbers
		ii++; 
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
	element.typewriter_in(0.5, 0)
	element.typewriter_sound(voice[page],0,1,1)
	element.draw(xx,yy)

	//voice[page]
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