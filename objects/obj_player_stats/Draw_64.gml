//Draw items for fast use
for(var i=0;i<5;i++){
	var slot_x = 54+(32*i), slot_y = GUIHEIGHT-66
	draw_sprite(spr_slot,0,slot_x+(1*i),slot_y)
	slot(global.inventory,i,slot_x+(1*i),slot_y,false)
}

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

draw_bar(54,GUIHEIGHT-34,hp,max_hp,c)
//MANA BAR
if mana/max_mana >= 0.66{
	var c=make_color_rgb(0,0,255)
}else if mana/max_mana >= 0.33{
	var c=make_color_rgb(0,150,255)	
}else if mana/max_mana >= 0{
	var c=make_color_rgb(0,255,255)
}

draw_bar(54,GUIHEIGHT-20,mana,max_mana,c)
//EXP BAR
draw_rectangle_color_fast(0,GUIHEIGHT-2,GUIWIDTH,GUIHEIGHT,c_yellow,false)
draw_rectangle_color_fast(0,GUIHEIGHT-2,GUIWIDTH*(expr/max_expr),GUIHEIGHT,c_orange,false)
draw_set_valign(fa_top)
draw_set_halign(fa_center)
draw_text_shadow(GUIWIDTH/2,GUIHEIGHT-24,lvlword+": "+string(level)+"  "+expword+": "+string(expr)+"/"+string(max_expr)+"  "+string((expr/max_expr)*100)+"%",fnt_small,1,c_gray,c_white,1)
