if room == room_main{
draw_sprite(spr_logo,0,40,0)
}
draw_set_halign(fa_right)
draw_set_valign(fa_center)
draw_text_shadow(GUIWIDTH-12,GUIHEIGHT-20,gameversion_word+string(GM_version),fnt_small,2,c_black,c_gray,1)

/*
scribble_font_set_default("fnt_small")
scribble(find_keyword("scribble_test")).draw(300,300)
scribble("here's[delay] some[delay] cute[delay] text!").draw(300,400)