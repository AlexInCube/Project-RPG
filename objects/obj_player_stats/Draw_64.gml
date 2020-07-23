/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_textbox){exit}
draw_set_font(fnt_small)
draw_set_color(c_black)


//draw_text(32,96,"Level: "+string(level))

draw_set_font(fnt_small)
//HEALTH BAR
draw_sprite(spr_borderbar,0,GUIWIDTH/2-165,GUIHEIGHT-47)
draw_sprite_ext(spr_hpbar,0,GUIWIDTH/2-165,GUIHEIGHT-47,hp/max_hp,1,0,c_white,1)
draw_set_halign(fa_center)
draw_text_color(GUIWIDTH/2-80,GUIHEIGHT-55,string(hp)+"/"+string(max_hp),txtcolor,txtcolor,txtcolor,txtcolor,1)
draw_set_halign(fa_left)
//MANA BAR
draw_sprite(spr_borderbar,0,GUIWIDTH/2,GUIHEIGHT-47)
draw_sprite_ext(spr_manabar,0,GUIWIDTH/2,GUIHEIGHT-47,mana/max_mana,1,0,c_white,1)
draw_set_halign(fa_center)
draw_text_color(GUIWIDTH/2+80,GUIHEIGHT-55,string(mana)+"/"+string(max_mana),txtcolor,txtcolor,txtcolor,txtcolor,1)
draw_set_halign(fa_left)
