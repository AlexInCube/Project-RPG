if !instance_exists(inventorywindow){
inventorywindow=scr_create_window(spr_inventorymenu,scr_find_keyword("inventory_window"),0,0,scr_inventoryscreen,[global.inventory])
inventorywindow.persistent=true
}else{
instance_destroy(inventorywindow)
}