function slimetrouble_to_give_slime(argument0) {
	var choice = argument0//if 0 give coin, if 1 give salve, if 2 for nothing
	deliver_items(item.slime,1)
	if choice == 0
	{
		gain_item(item.coin,1)
	}
	else if choice == 1
	{
		gain_item(item.star_salve,1)
	}

	change_variable(obj_nikitanpc,"choice_variable","nikita_thanks_for_help")


}
