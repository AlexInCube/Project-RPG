/// @description Insert description here
// You can write your code in this editor
if room=room_pause{exit}

draw_set_font(fnt_main)
draw_set_color(c_black)


draw_text(32,96,"Level: "+string(level))

var guiwidth = display_get_gui_width()
var guiheight = display_get_gui_height()

draw_set_font(fnt_small)
//HEALTH BAR
draw_sprite(spr_borderbar,0,guiwidth/2-165,guiheight-47)
draw_sprite_ext(spr_hpbar,0,guiwidth/2-165,guiheight-47,hp/maxhp,1,0,c_white,1)
draw_set_halign(fa_center)
draw_text_color(guiwidth/2-80,guiheight-55,string(hp)+"/"+string(maxhp),txtcolor,txtcolor,txtcolor,txtcolor,1)
draw_set_halign(fa_left)
//MANA BAR
draw_sprite(spr_borderbar,0,guiwidth/2,guiheight-47)
draw_sprite_ext(spr_manabar,0,guiwidth/2,guiheight-47,mana/maxmana,1,0,c_white,1)
draw_set_halign(fa_center)
draw_text_color(guiwidth/2+80,guiheight-55,string(mana)+"/"+string(maxmana),txtcolor,txtcolor,txtcolor,txtcolor,1)
draw_set_halign(fa_left)