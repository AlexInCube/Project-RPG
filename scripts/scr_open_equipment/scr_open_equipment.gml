if !instance_exists(equipmentwindow){
equipmentwindow=scr_create_window(spr_equipmenu,scr_find_keyword("equipment_window"),0,0,scr_equipmentscreen,[global.armor_equipped])
equipmentwindow.persistent=true
}else{
instance_destroy(equipmentwindow)
}