depth =-100
ds_saves = ds_map_create()//Contain saves name folder
create_saves_map()

drawelementstart = 0//Start drawing ds_list from position
drawelementheight = round((GUIHEIGHT-20)/(sprite_get_height(spr_save_slot)+21))-1

ss_w = GUIHEIGHT-20
ss_h = sprite_get_height(spr_save_slot)+16

createslot_word = find_keyword("create_new_save_slot")
write_your_save_name_word = find_keyword("write_your_save_name")