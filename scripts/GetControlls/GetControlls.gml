///@description
///@function get_input_key(input_device,key_map,press_type)
#macro KEYBOARD 0
function get_input_key(){

}

function get_input() {
	up = keyboard_check(global.settings.controls.key_up)
	left = keyboard_check(global.settings.controls.key_left)
	right = keyboard_check(global.settings.controls.key_right)
	down = keyboard_check(global.settings.controls.key_down)

	dialogue_scroll_up=keyboard_check_pressed(ord("W"))
	dialogue_scroll_down=keyboard_check_pressed(ord("S"))

	inventory_hotkey1 = keyboard_check_pressed(global.settings.controls.inventory_hotkey1)
	inventory_hotkey2 = keyboard_check_pressed(global.settings.controls.inventory_hotkey2)
	inventory_hotkey3 = keyboard_check_pressed(global.settings.controls.inventory_hotkey3)
	inventory_hotkey4 = keyboard_check_pressed(global.settings.controls.inventory_hotkey4)
	inventory_hotkey5 = keyboard_check_pressed(global.settings.controls.inventory_hotkey5)
	inventory_hotkey6 = keyboard_check_pressed(global.settings.controls.inventory_hotkey6)
	inventory_hotkey7 = keyboard_check_pressed(global.settings.controls.inventory_hotkey7)
	inventory_hotkey8 = keyboard_check_pressed(global.settings.controls.inventory_hotkey8)
	inventory_hotkey9 = keyboard_check_pressed(global.settings.controls.inventory_hotkey9)
	inventory_hotkey10 = keyboard_check_pressed(global.settings.controls.inventory_hotkey10)

	//Pickup item
	pickup_key = keyboard_check_pressed(global.settings.controls.pickup_key)
	//Used in dialogue, open chest and interact with objects.
	interact_key = keyboard_check_pressed(global.settings.controls.interact_key)
	//Attack
	attack_key = keyboard_check_pressed(global.settings.controls.attack_key)
	//Reloading
	reloading_key = keyboard_check_pressed(global.settings.controls.reloading_key)
	//Open window with armor and stats
	equipment_key = keyboard_check_pressed(global.settings.controls.equipment_key)
	//Open window with player stuff
	inventory_key = keyboard_check_pressed(global.settings.controls.inventory_key)
	//Open quest list
	questlist_key = keyboard_check_pressed(global.settings.controls.questlist_key)
	//Drop item from inventory slot
	drop_item_key = keyboard_check_pressed(global.settings.controls.drop_item_key)
	//Drop one item from slot instead of full item stack
	combination_key = keyboard_check(global.settings.controls.combination_key)
	//Pause menu
	pause_key = keyboard_check_pressed(global.settings.controls.pause_key)

	//Debug menu
	developer_key = keyboard_check_pressed(global.settings.controls.developer_key)


	xaxis = (right - left)
	yaxis = (down - up)
}
