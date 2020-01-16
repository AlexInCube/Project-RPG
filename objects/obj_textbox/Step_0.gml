if obj_controller.interact_key
{
	if(counter<str_len){counter=str_len}
	else if (page < array_length_1d(text) -1)
	{
		page++
		event_perform(ev_other, ev_user0)
	}
	else
	{
		instance_destroy()
		obj_inventory.inventorylock=false
	}
}