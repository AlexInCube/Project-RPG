function open_inventory() {
	if !instance_exists(inventorywindow){
	inventorywindow=create_window(spr_inventorymenu,find_keyword("inventory_window"),0,0,inventoryscreen,[global.inventory])
	inventorywindow.persistent=true
	}else{
	instance_destroy(inventorywindow)
	}


}
