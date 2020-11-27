

guiid=0
chestname="Chest"
findradius=30
chestinventory = ds_grid_create(15, 2); 
ds_grid_clear(chestinventory,0)

function interact(){
	guiid=create_window(300,300,obj_inventorywindow)
	with(guiid){
		event_user(0)
		window_name = self.chestname
		inventory = self.chestinventory
	}
}