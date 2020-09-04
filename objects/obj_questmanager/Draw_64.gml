//Draw quest notifications about starting quest, updating and completing
if txtalpha!=0{
	draw_set_halign(fa_center)
	scr_draw_text_shadow(GUIWIDTH/2,GUIHEIGHT/2-200,notificationquestname,fnt_verylarge,1,c_black,txtcolor,txtalpha)
	scr_draw_text_shadow(GUIWIDTH/2,GUIHEIGHT/2-165,scr_find_keyword("notificationqueststate_"+string(notificationqueststate)),fnt_small,1,c_black,txtcolor,txtalpha)
}

if tracking_quest!=noone{
	draw_set_halign(fa_right)
	draw_set_valign(fa_top)
	scr_draw_text_shadow(GUIWIDTH-10,40,tq_name,fnt_large,1,c_gray,c_white,1)
	scr_draw_text_shadow(GUIWIDTH-10,65,tq_desc,fnt_small,1,c_gray,c_white,1)
}