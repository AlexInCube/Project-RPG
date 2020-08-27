/// @description Draw Buttons
//Draw HUD buttons

if !instance_exists(obj_textbox){
draw_sprite(spr_hudbuttonsbackground,0,GUIWIDTH-224,GUIHEIGHT-40)
if inventory_key{scr_open_inventory()}else if equipment_key{scr_open_equipment()}else if questlist_key{scr_open_quest_list()}
scr_draw_button(GUIWIDTH-224,GUIHEIGHT-36,GUIWIDTH-188,GUIHEIGHT,spr_backpack,scr_open_inventory)//Open inventory window
scr_draw_button(GUIWIDTH-187,GUIHEIGHT-36,GUIWIDTH-151,GUIHEIGHT,spr_equipment,scr_open_equipment)//Open equipment
scr_draw_button(GUIWIDTH-150,GUIHEIGHT-36,GUIWIDTH-115,GUIHEIGHT,spr_open_quest_list,scr_open_quest_list)//Open quest list
scr_draw_button(GUIWIDTH-114,GUIHEIGHT-36,GUIWIDTH-78,GUIHEIGHT,spr_craft,scr_open_settings)//Open settings (maybe pause menu later)
//scr_draw_button(GUIWIDTH-77,GUIHEIGHT-36,GUIWIDTH-41,GUIHEIGHT,spr_settings,nothing)//Open craft window
}




