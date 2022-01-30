if instance_exists(obj_textbox){exit}
if global.interface_lock_by_game {exit}
draw_set_alpha(1)
//Draw buff bar
//Cycle through the player buff_grid
var xx=0, i=0; repeat ds_grid_width(buff_grid){
	//Get struct from buff
	i++
	var effect_id = buff_grid[# i-1,0]
	if is_undefined(effect_id) or effect_id = UNKNOWN_EFFECT{continue}
	var _effect_struct = return_struct_from_effect_index_by_effect_id(buff_grid[# i-1,0])
	if _effect_struct[$ EFFECT_HIDE_ICON] == true{ continue}//If hide_icon true, dont draw icon and dont increase X offset
	draw_effect(draw_effect_start_x+(32*xx),GUIHEIGHT-40,buff_grid,i-1)
	xx++
}

//Draw items for fast use
var fast_use_block_x = 4
var fast_use_block_y = GUIHEIGHT-40

for(var i=0;i<5;i++){
	var slot_x = fast_use_block_x+fast_slots[i], slot_y = fast_use_block_y
	draw_sprite(spr_slot,0,slot_x,slot_y)
	slot(global.inventory,i,slot_x,slot_y,false)
}
//Draw button hints for fast use items
if global.settings.interface.show_button_hint{
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_button_hint(fast_use_block_x+fast_slots[0],fast_use_block_y,global.settings.controls.inventory_hotkey1)
	draw_button_hint(fast_use_block_x+fast_slots[1],fast_use_block_y,global.settings.controls.inventory_hotkey2)
	draw_button_hint(fast_use_block_x+fast_slots[2],fast_use_block_y,global.settings.controls.inventory_hotkey3)
	draw_button_hint(fast_use_block_x+fast_slots[3],fast_use_block_y,global.settings.controls.inventory_hotkey4)
	draw_button_hint(fast_use_block_x+fast_slots[4],fast_use_block_y,global.settings.controls.inventory_hotkey5)
}
draw_set_font(fnt_small)
draw_set_color(c_black)


//PLAYER PORTRAIT
var player_bar_x = 0
var player_bar_y = GUIHEIGHT-90
draw_sprite(spr_player_back_bar,0,player_bar_x,player_bar_y)


draw_set_font(fnt_verysmall)
draw_set_color(c_white)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
//HEALTHBAR								//134 sprite width, 12 sprite height
draw_sprite_part(spr_player_hp_bar,0,0,0,134*(stats.hp/stats.max_hp.getValue()),12,player_bar_x+39,player_bar_y+10)
draw_text(player_bar_x+45,player_bar_y+10,string(stats.hp)+"/"+string(stats.max_hp.getValue()))
//MANABAR								//150 sprite width, 12 sprite height
draw_sprite_part(spr_player_mana_bar,0,0,0,150*(stats.mana/stats.max_mana.getValue()),12,player_bar_x+39,player_bar_y+26)
draw_text(player_bar_x+45,player_bar_y+26,string(stats.mana)+"/"+string(stats.max_mana.getValue()))


//EXP BAR
draw_rectangle_color_fast(0,GUIHEIGHT-2,GUIWIDTH,GUIHEIGHT,c_yellow,false)
draw_rectangle_color_fast(0,GUIHEIGHT-2,GUIWIDTH*(expr/max_expr),GUIHEIGHT,c_orange,false)
draw_set_valign(fa_top)
draw_set_halign(fa_center)
draw_text_shadow(GUIWIDTH/2,GUIHEIGHT-24,lvlword+": "+string(level)+"  "+expword+": "+string(expr)+"/"+string(max_expr)+"  "+string((expr/max_expr)*100)+"%",fnt_small,1,c_gray,c_white,1)
