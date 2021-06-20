#region INVENTORY
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
#endregion 

#region EQUIPMENT
equipment = global.equipment
equipment_size = ds_grid_width(equipment)
equipment_x = 300
equipment_y = obj_gui_screen_controller.screen_start_y
#endregion

#region STATS
attribute_pointsword = find_keyword("attribute_points")
stats_x = 340
stats_y = obj_gui_screen_controller.screen_start_y

stats_array = [
	//Stat name, stat description
	[find_keyword("strength"),find_keyword("strengthdescription"),"strength"],
	[find_keyword("agility"),find_keyword("agilitydescription"),"agility"],
	[find_keyword("defense"),find_keyword("defensedescription"),"defense"],
	[find_keyword("energy"),find_keyword("energydescription"),"energy"]
]
#endregion

event_user(0)