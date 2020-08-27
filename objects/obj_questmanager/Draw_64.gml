//Draw quest notifications about starting quest, updating and completing
if txtalpha!=0{
	draw_set_halign(fa_center)
	scr_draw_text_shadow(GUIWIDTH/2,GUIHEIGHT/2-200,notificationquestname,fnt_verylarge,1,c_black,txtcolor,txtalpha)
	scr_draw_text_shadow(GUIWIDTH/2,GUIHEIGHT/2-165,scr_find_keyword("notificationqueststate_"+string(notificationqueststate)),fnt_small,1,c_black,txtcolor,txtalpha)
}

if tracking_quest!=noone{
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	var qn = string(scr_quest_get_name(tracking_quest))
	var qn_sw = string_width(qn)
	scr_draw_text_shadow(GUIWIDTH-10-qn_sw,GUIHEIGHT,qn,fnt_large,1,c_green,c_lime,1)
}