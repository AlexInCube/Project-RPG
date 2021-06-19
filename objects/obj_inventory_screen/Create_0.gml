inventory = global.inventory
inventory_size = ds_grid_width(inventory)
/* 
Setup slots number and size 
*/
inventory_x = 50
inventory_y = obj_gui_screen_controller.screen_start_y
cell_size=32//Slot size
//Starting XY
slots_x=8
slots_y=8
//Free space between slots
x_buffer=1
y_buffer=1

event_user(0)