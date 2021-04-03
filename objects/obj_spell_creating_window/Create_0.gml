///@description Inventory Window for Player/Chests inventories
event_inherited();

window_name=find_keyword("spell_creating_window")
window_sprite=spr_spell_creating_window
window_width=sprite_get_width(window_sprite)
window_height=sprite_get_height(window_sprite)
window_x = 450
window_y = 0
persistent=true

spell_data = ds_grid_create(8,8)
ds_grid_clear(spell_data,PIECES_GROUP_GENERAL[? "Test"])
/* 
Setup slots number and size 
*/
selected_slot = [-1,-1]//Rows/columns
selected_group = PIECES_GROUP_GENERAL
slot_sprite = spr_spell_creating_empty_piece
cell_size=32//Slot size
//Starting XY
slots_x=14
slots_y=14
//Free space between slots
x_buffer=2
y_buffer=2

event_user(0)