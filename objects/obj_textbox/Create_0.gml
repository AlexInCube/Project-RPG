/// @description

if(instance_number(obj_textevent)>1 or instance_number(obj_textbox)>1){ instance_destroy(); exit; }

//-----------Customise (FOR USER)
portrait_frame		= spr_portraitframe;
dialogue_box		= spr_dialoguebox;
name_box			= spr_namebox;
finished_effect		= spr_dialoguefinished;

choice_snd_effect	= snd_moveselect;
select_snd_effect	= snd_select;

default_col			= c_black;
choice_col			= c_blue;
select_col			= c_red;
name_col			= c_black;

name_font			= "fnt_small";
dialogue_font		= "fnt_small"
priority_snd_effect = 5;

//-----------Setup (LEAVE THIS STUFF)
#region
speaker			= noone;

boxHeight		= sprite_get_height(dialogue_box)
boxWidth		= sprite_get_width(dialogue_box)
gui_width		= display_get_gui_width();
gui_height		= display_get_gui_height();
gb_diff			= gui_width - boxWidth;
portraitWidth	= sprite_get_width(portrait_frame)
finishede_num	= sprite_get_number(finished_effect);
finishede_spd	= (sprite_get_speed(spr_dialoguefinished)/60);

pos_x			= (gb_diff/2)+(portraitWidth/2);
pos_y			= gui_height-boxHeight

name_box_x		= pos_x - portraitWidth
name_box_y		= pos_y - sprite_get_height(name_box)
name_box_text_x = name_box_x + ((sprite_get_width(name_box))/2);
name_box_text_y = name_box_y

finishede_x		= pos_x + boxWidth - 15
finishede_y		= pos_y + boxHeight - 35

charCount		= 0;
charCount_f		= 0;
text_speed_c	= 0;
audio_c			= 0;
page			= 0;
str_len			= -1;
pause			= false;
chosen			= false;
choice			= 0;

creator			= noone;
type			= 0;
text			= -1;
text_NE			= -1;
breakpoints		= -1;
nextline		= 0;
text_col		= c_black;
emotion			= 0;

portrait		= 1;
voice			= 1;
font			= 1;

charSize		= 10;
stringHeight	= 1;

//---------------------Effect variables

t			= 0;
amplitude	= 4;
freq		= 2;

#endregion
instance_destroy(obj_basicwindow,true)