//Draw quest notifications about starting quest, updating and completing

if txtalpha>0{
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	draw_text_shadow(GUIWIDTH/2,GUIHEIGHT/2-200,notificationquestname,fnt_verylarge,1,c_black,txtcolor,txtalpha)
	draw_text_shadow(GUIWIDTH/2,GUIHEIGHT/2-165,find_keyword("notificationqueststate_"+string(notificationqueststate)),fnt_small,1,c_black,txtcolor,txtalpha)
}
//Draw the quest which player want track
if !instance_exists(obj_textbox){
	if !is_undefined(tracking_quest){
		draw_set_halign(fa_right)
		draw_set_valign(fa_top)
		draw_text_shadow(GUIWIDTH-10,40,tq_name,fnt_large,1,c_gray,c_white,1)
		draw_text_shadow(GUIWIDTH-10,65,tq_desc,fnt_small,1,c_gray,c_white,1)
	}
}