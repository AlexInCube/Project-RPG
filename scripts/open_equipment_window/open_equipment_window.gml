function open_equipment() {
	if !instance_exists(equipmentwindow){
		equipmentwindow=create_window(equipment_window_x,equipment_window_y,obj_equipmentwindow)
		with(equipmentwindow){
			event_user(0)
		}
	}else{
		instance_destroy(equipmentwindow)
	}
}
