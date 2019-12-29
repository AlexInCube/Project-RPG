/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_main)
draw_set_color(c_black)
draw_text(32,32,"Health: "+string(hp) + "/" + string(maxhp))
draw_text(32,64,"Mana: "+string(mana) + "/" + string(maxmana))
draw_text(32,96,"Level: "+string(level))

