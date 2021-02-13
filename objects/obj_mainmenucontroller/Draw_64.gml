if room == room_main{
draw_sprite(spr_logo,0,40,0)
}
draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_text_shadow(12,GUIHEIGHT-20,gameversion_word+string(GM_version),fnt_small,2,c_black,c_gray,1)
