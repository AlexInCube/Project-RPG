function slimetrouble_to_give_slime(argument0) {
	var choice = argument0//if 0 give coin, if 1 give salve, if 2 for nothing
	grab_item(item.slime,1,global.inventory)
	if choice == 0
	{
		gain_item(item.coin,1,global.inventory)
	}
	else if choice == 1
	{
		gain_item(item.star_salve,1,global.inventory)
	}

	change_variable(obj_nikitanpc,"choice_variable","nikita_thanks_for_help")


}
