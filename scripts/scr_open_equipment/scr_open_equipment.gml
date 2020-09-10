function open_equipment() {
	if !instance_exists(equipmentwindow){
	equipmentwindow=create_window(spr_equipmenu,find_keyword("equipment_window"),0,0,equipmentscreen,[global.equipment])
	equipmentwindow.persistent=true
	}else{
	instance_destroy(equipmentwindow)
	}


}
