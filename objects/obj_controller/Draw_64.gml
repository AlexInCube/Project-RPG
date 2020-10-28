/// @description Draw Buttons
//Draw HUD buttons

if !instance_exists(obj_textbox){
draw_sprite(spr_hudbuttonsbackground,0,GUIWIDTH-224,GUIHEIGHT-40)
if inventory_key{open_inventory()}else if equipment_key{open_equipment()}else if questlist_key{open_quest_list()}
draw_button_hud(GUIWIDTH-224,GUIHEIGHT-36,GUIWIDTH-188,GUIHEIGHT,spr_backpack,open_inventory)//Open inventory window
draw_button_hud(GUIWIDTH-187,GUIHEIGHT-36,GUIWIDTH-151,GUIHEIGHT,spr_equipment,open_equipment)//Open equipment
draw_button_hud(GUIWIDTH-150,GUIHEIGHT-36,GUIWIDTH-115,GUIHEIGHT,spr_open_quest_list,open_quest_list)//Open quest list
draw_button_hud(GUIWIDTH-114,GUIHEIGHT-36,GUIWIDTH-78,GUIHEIGHT,spr_craft,open_settings)//Open settings (maybe pause menu later)
//draw_button(GUIWIDTH-77,GUIHEIGHT-36,GUIWIDTH-41,GUIHEIGHT,spr_settings,nothing)//Open craft window
}


