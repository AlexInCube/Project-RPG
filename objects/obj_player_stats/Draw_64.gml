/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_main)
draw_set_color(c_black)
draw_text(32,32,"Health: "+string(hp) + "/" + string(maxhp))
draw_text(32,64,"Mana: "+string(mana) + "/" + string(maxmana))
draw_text(32,96,"Level: "+string(level))

var guiwidth = display_get_gui_width()
var guiheight = display_get_gui_height()

draw_set_font(fnt_small)
draw_sprite(spr_borderbar,0,guiwidth/2-165,guiheight-47)
draw_sprite_ext(spr_hpbar,0,guiwidth/2-165,guiheight-47,hp/maxhp,1,0,c_white,1)
//draw_text_color(guiwidth/2-162,guiheight-47,string(hp)+"/"+string(maxhp),c_black,c_black,c_black,c_black,1)

draw_sprite(spr_borderbar,0,guiwidth/2,guiheight-47)
draw_sprite_ext(spr_manabar,0,guiwidth/2,guiheight-47,mana/maxmana,1,0,c_white,1)