//Draw Box
draw_sprite(box, 0, box_x,box_y)

//Draw Portrait Back
draw_sprite(frame, 0, port_x, port_y)

//Draw Portrait
draw_sprite(portrait, 0, port_x,port_y)

//Draw Portrait Frame
draw_sprite(frame, 1, port_x, port_y)

//Draw Namebox
draw_sprite(namebox, 0, namebox_x, namebox_y)

//Draw Name
var c = drawtxtcol
draw_set_halign(fa_center);draw_set_valign(fa_middle)
draw_text_color(name_text_x, name_text_y, name, c,c,c,c, 1)
draw_set_halign(fa_left);draw_set_valign(fa_top)
//Draw Text
if(counter<str_len)
{
	counter++
	if (counter mod 4 == 0)
	{
	audio_play_sound(voice,10,false)
	}
}
var substr = string_copy(text_wrapped,1,counter)

draw_text_color(text_x, text_y, substr,  c,c,c,c, 1)