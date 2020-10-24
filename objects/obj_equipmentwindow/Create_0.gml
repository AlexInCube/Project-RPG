///@description Inventory Window for Player/Chests inventories
event_inherited();

window_name=find_keyword("equipment_window")
window_sprite=spr_equipmenu
window_width=sprite_get_width(window_sprite)
window_height=sprite_get_height(window_sprite)
persistent=true
//Setup inventory
inventory = global.equipment
inventory_size = ds_grid_width(inventory)
/* 
Setup slots number and size 
*/
cell_size=32//Slot size
//Starting XY
slots_x=8
slots_y=32
//Free space between slots
x_buffer=1
y_buffer=1

event_user(0)