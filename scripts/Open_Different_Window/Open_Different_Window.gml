function open_inventory() {
	if !instance_exists(inventorywindow){
		inventorywindow=create_window(inventory_window_x,inventory_window_y,obj_inventorywindow)
		with(inventorywindow){
			event_user(0)
		}
	}else{
		instance_destroy(inventorywindow)
	}
}

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

function open_quest_list() {
	if !instance_exists(questlistwindow){
		questlistwindow=create_window(questlist_window_x,questlist_window_y,obj_questlistwindow)
	}else{
		instance_destroy(questlistwindow)
	}
}

function open_trade_window(trade_arr){
	if !instance_exists(obj_tradewindow){
		with create_window((GUIWIDTH/2)-150,(GUIHEIGHT/2)-124,obj_tradewindow){
			trade_array = trade_arr
			event_user(0)
		}
	}else{
		instance_destroy(obj_tradewindow)
	}
}
