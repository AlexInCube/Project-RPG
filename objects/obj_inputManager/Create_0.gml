enum actions {
	move_left,
	move_right,
	move_up,
	move_down,
	attack,
	pickup_item,
	interacting,
	reloading,
	open_inventory,
	open_quest_list,
	drop_item,
	combination,
	pause,
	addition_info,
	debug_info,
	quick_slot_1,
	quick_slot_2,
	quick_slot_3,
	quick_slot_4,
	quick_slot_5,
}

function setup_input_for_action(keys,action){
	for(var i = 0; i < 2; i++){
		var mouse_key = ""
		
		switch(keys[i]){
			case "mb_left": mouse_key = mb_left break
			case "mb_right": mouse_key = mb_right break
			case "mb_side1": mouse_key = mb_side1 break
			case "mb_side2": mouse_key = mb_side2 break
			case "": input_binding_remove(action,INPUT_SOURCE.KEYBOARD_AND_MOUSE,0,i) exit break
		}
		
		if mouse_key = ""{
			input_default_key(keys[i],action,i)
		}else{
			input_default_mouse_button(mouse_key,action,i)
		}
	}
}


function setup_input(){
setup_input_for_action(global.settings.controls.key_up,actions.move_up)
setup_input_for_action(global.settings.controls.key_down,actions.move_down)
setup_input_for_action(global.settings.controls.key_left,actions.move_left)
setup_input_for_action(global.settings.controls.key_right,actions.move_right)

setup_input_for_action(global.settings.controls.attack_key,actions.attack)
setup_input_for_action(global.settings.controls.pickup_key,actions.pickup_item)
setup_input_for_action(global.settings.controls.interact_key,actions.interacting)
setup_input_for_action(global.settings.controls.reloading_key,actions.reloading)
setup_input_for_action(global.settings.controls.drop_item_key,actions.drop_item)
setup_input_for_action(global.settings.controls.combination_key,actions.combination)
setup_input_for_action(global.settings.controls.addition_key,actions.addition_info)

setup_input_for_action(global.settings.controls.inventory_key,actions.open_inventory)
setup_input_for_action(global.settings.controls.questlist_key,actions.open_quest_list)

setup_input_for_action(global.settings.controls.developer_key,actions.debug_info)
setup_input_for_action(global.settings.controls.pause_key,actions.pause)

setup_input_for_action(global.settings.controls.inventory_hotkey1,actions.quick_slot_1)
setup_input_for_action(global.settings.controls.inventory_hotkey2,actions.quick_slot_2)
setup_input_for_action(global.settings.controls.inventory_hotkey3,actions.quick_slot_3)
setup_input_for_action(global.settings.controls.inventory_hotkey4,actions.quick_slot_4)
setup_input_for_action(global.settings.controls.inventory_hotkey5,actions.quick_slot_5)

input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE);
}

setup_input()