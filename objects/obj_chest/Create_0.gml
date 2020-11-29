guiid=0
chestname="Chest"
findradius=30
slots_quantity = 15
chestinventory = ds_grid_create(slots_quantity, 2); 
ds_grid_clear(chestinventory,0)


interact_radius = 16
function interact(){
	guiid=create_window(300,300,obj_inventorywindow)
	with(guiid){
		event_user(0)
	}
	guiid.window_name = chestname
	guiid.inventory = chestinventory
}