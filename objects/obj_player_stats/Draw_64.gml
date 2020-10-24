/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_textbox){exit}
draw_set_font(fnt_small)
draw_set_color(c_black)


//PLAYER PORTRAIT
draw_sprite(spr_player_hud_portrait,0,6,GUIHEIGHT-54)
draw_sprite_stretched(spr_player_down,0,16,GUIHEIGHT-50,34,34)
draw_set_font(fnt_small)
draw_set_valign(fa_top)
draw_set_halign(fa_center)
//HEALTH BAR
if hp/max_hp >= 0.66{
	var c=make_color_rgb(0,255,0)
}else if hp/max_hp >= 0.33{
	var c=make_color_rgb(255,255,0)	
}else if hp/max_hp >= 0{
	var c=make_color_rgb(255,0,0)
}

draw_sprite(spr_borderbar,0,54,GUIHEIGHT-34)
draw_sprite_ext(spr_hpbar,0,56,GUIHEIGHT-32,hp/max_hp,1,0,c,1)
draw_text_color(90,GUIHEIGHT-40,string(hp)+"/"+string(max_hp),txtcolor,txtcolor,txtcolor,txtcolor,1)
//MANA BAR
if mana/max_mana >= 0.66{
	var c=make_color_rgb(0,0,255)
}else if mana/max_mana >= 0.33{
	var c=make_color_rgb(0,150,255)	
}else if mana/max_mana >= 0{
	var c=make_color_rgb(0,255,255)
}

draw_sprite(spr_borderbar,0,54,GUIHEIGHT-20)
draw_sprite_ext(spr_hpbar,0,56,GUIHEIGHT-18,mana/max_mana,1,0,c,1)
draw_text_color(90,GUIHEIGHT-26,string(mana)+"/"+string(max_mana),txtcolor,txtcolor,txtcolor,txtcolor,1)
//EXP BAR
draw_rectangle_color_fast(0,GUIHEIGHT-2,GUIWIDTH,GUIHEIGHT,c_yellow,false)

