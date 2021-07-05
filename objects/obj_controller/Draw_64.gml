/// @description Draw Buttons
//Draw HUD buttons
if instance_exists(obj_textbox) exit
if global.interface_lock_by_game {exit}

draw_set_alpha(1)

//HUD buttons block
/*
var hud_block_x = GUIWIDTH-224
var hud_block_y = GUIHEIGHT-36
draw_button_hud(hud_block_x+inventory_button_x,hud_block_y,spr_backpack,inventory_button_name,open_inventory)//Open inventory window
draw_button_hud(hud_block_x+equipment_button_x,hud_block_y,spr_equipment,equipment_button_name,open_equipment)//Open equipment
draw_button_hud(hud_block_x+questlist_button_x,hud_block_y,spr_open_quest_list,questlist_button_name,open_quest_list)//Open quest list
draw_button_hud(hud_block_x+craft_button_x,hud_block_y,spr_craft,craft_button_name,open_craft)//Open quest list

if global.settings.interface.show_button_hint{
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_button_hint(GUIWIDTH-218,GUIHEIGHT-66,global.settings.controls.inventory_key)
	draw_button_hint(GUIWIDTH-181,GUIHEIGHT-66,global.settings.controls.equipment_key)
	draw_button_hint(GUIWIDTH-144,GUIHEIGHT-66,global.settings.controls.questlist_key)
}
*/

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_shadow(GUIWIDTH-50,5,string(get_formatted_date(hours))+":"+string(get_formatted_date(minutes)),fnt_small,1,c_black,c_white,1)