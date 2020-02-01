up = keyboard_check(global.key_up)
left = keyboard_check(global.key_left)
right = keyboard_check(global.key_right)
down = keyboard_check(global.key_down)

dialogue_scroll_up=keyboard_check_pressed(ord("W"))
dialogue_scroll_down=keyboard_check_pressed(ord("S"))

inventory_hotkey1 = keyboard_check_pressed(global.inventory_hotkey1)
inventory_hotkey2 = keyboard_check_pressed(global.inventory_hotkey2)
inventory_hotkey3 = keyboard_check_pressed(global.inventory_hotkey3)
inventory_hotkey4 = keyboard_check_pressed(global.inventory_hotkey4)
inventory_hotkey5 = keyboard_check_pressed(global.inventory_hotkey5)
inventory_hotkey6 = keyboard_check_pressed(global.inventory_hotkey6)
inventory_hotkey7 = keyboard_check_pressed(global.inventory_hotkey7)
inventory_hotkey8 = keyboard_check_pressed(global.inventory_hotkey8)
inventory_hotkey9 = keyboard_check_pressed(global.inventory_hotkey9)
inventory_hotkey10 = keyboard_check_pressed(global.inventory_hotkey10)

pickup_key = keyboard_check_pressed(global.pickup_key)
interact_key = keyboard_check_pressed(global.interact_key)
attack_key = keyboard_check_pressed(global.attack_key)
skillbook_key = keyboard_check_pressed(global.skillbook_key)
inventory_key = keyboard_check_pressed(global.inventory_key)
drop_item_key = keyboard_check_pressed(global.drop_item_key)
combination_key = keyboard_check(global.combination_key)
pause_key = keyboard_check_pressed(global.pause_key)

developer_key = keyboard_check_pressed(global.developer_key)


xaxis = (right - left)
yaxis = (down - up)