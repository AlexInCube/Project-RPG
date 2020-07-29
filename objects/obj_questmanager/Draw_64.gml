//Draw quest notifications about starting quest, updating and completing
if txtalpha!=0{

	draw_set_font(fnt_verylarge)
	draw_set_halign(fa_center)
	scr_draw_text_shadow(GUIWIDTH/2,GUIHEIGHT/2-200,notificationquestname,fnt_verylarge,2,c_black,txtcolor,txtalpha)
	scr_draw_text_shadow(GUIWIDTH/2,GUIHEIGHT/2-180,scr_find_keyword("notificationqueststate_"+string(notificationqueststate)),fnt_verylarge,2,c_black,txtcolor,txtalpha)
}