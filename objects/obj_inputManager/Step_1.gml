input_tick()
input_hotswap_tick()

up = input_check(actions.move_up)
left = input_check(actions.move_left)
right = input_check(actions.move_right)
down = input_check(actions.move_down)

dialogue_scroll_up=input_check_pressed(actions.move_up)
dialogue_scroll_down=input_check_pressed(actions.move_down)

inventory_hotkey1 = input_check_pressed(actions.quick_slot_1)
inventory_hotkey2 = input_check_pressed(actions.quick_slot_2)
inventory_hotkey3 = input_check_pressed(actions.quick_slot_3)
inventory_hotkey4 = input_check_pressed(actions.quick_slot_4)
inventory_hotkey5 = input_check_pressed(actions.quick_slot_5)

pickup_key = input_check_pressed(actions.pickup_item)
//Used in dialogue, open chest and interact with objects.
interact_key = input_check_pressed(actions.interacting)
attack_key = input_check_pressed(actions.attack)
reloading_key = input_check_pressed(actions.reloading)
inventory_key = input_check_pressed(actions.open_inventory)
questlist_key = input_check_pressed(actions.open_quest_list)
//Drop item from inventory slot
drop_item_key = input_check_pressed(actions.drop_item)
//Drop one item from slot instead of full item stack
combination_key = input_check(actions.combination)
pause_key = input_check_pressed(actions.pause)

debug_key = input_check_pressed(actions.debug_info)

xaxis = right - left
yaxis = down - up

if global.settings.controls.invert_addition_info{
	addition_key = !input_check(actions.addition_info)
}else{
	addition_key = input_check(actions.addition_info)
}