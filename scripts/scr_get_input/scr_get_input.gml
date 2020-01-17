up = keyboard_check(ord("W"))
left = keyboard_check(ord("A"))
right = keyboard_check(ord("D"))
down = keyboard_check(ord("S"))

dialogue_scroll_up=keyboard_check_pressed(ord("W"))
dialogue_scroll_down=keyboard_check_pressed(ord("S"))

inventory_hotkey1 = keyboard_check_pressed(ord("1"))
inventory_hotkey2 = keyboard_check_pressed(ord("2"))
inventory_hotkey3 = keyboard_check_pressed(ord("3"))
inventory_hotkey4 = keyboard_check_pressed(ord("4"))
inventory_hotkey5 = keyboard_check_pressed(ord("5"))
inventory_hotkey6 = keyboard_check_pressed(ord("6"))
inventory_hotkey7 = keyboard_check_pressed(ord("7"))
inventory_hotkey8 = keyboard_check_pressed(ord("8"))
inventory_hotkey9 = keyboard_check_pressed(ord("9"))
inventory_hotkey10 = keyboard_check_pressed(ord("0"))

pickup_key = keyboard_check_pressed(vk_space)
interact_key = keyboard_check_pressed(ord("E"))
attack_key = keyboard_check_pressed(ord("V"))
skillbook_key = keyboard_check_pressed(ord("O"))
inventory_key = keyboard_check_pressed(ord("I"))
drop_item_key = keyboard_check_pressed(ord("Q"))
combination_key = keyboard_check(vk_control)
pause_key = keyboard_check_pressed(vk_escape)

developer_key = keyboard_check_pressed(vk_f5)


xaxis = (right - left)
yaxis = (down - up)