/// @description Gain items for the player
/// @function item_gain(slot, amount);
/// @param item_id
/// @param max_amount
/// @param [inv] global.inventory is default
/// @param [slot] optional
function item_gain(item_id, max_amount, inv = global.inventory, _slot) {
	//Max item stack
	var total      = return_struct_from_item_index_by_item_id(item_id)[$ "item_stacking"]
	var cur_amount = 0
	var cur_slot   = 0;
	if !is_undefined(_slot){
		cur_slot = _slot
	}
	var max_slot   = ds_grid_width(inv);

	while (cur_slot < max_slot)//If inventory have slots at least 1 slot
	{
		if (inv[# cur_slot, 0] == item_id) || (inv[# cur_slot, 0] == NO_ITEM)//And that slot is empty
			{
					while (cur_amount < max_amount)//Add items one at a time until the required number is added
					{
						if inv[# cur_slot, 1] != total//If itemstack != maximum item stack
						{
							inv[# cur_slot, 0] = item_id;
							inv[# cur_slot, 1] += 1;
							cur_amount += 1
							var _item_struct = return_struct_from_item_index_by_item_inv(inv,cur_slot)
							if _item_struct != (-1 or undefined)
							{
								if _item_struct[$ "item_create"] != undefined
								{
									inv[# cur_slot, 2] = deep_copy(_item_struct[$ "item_create"])
								}
							}
						}
						else//If itemstack = max stack, then create NBTdata struct.
						{
							event_fire(EVENT_ITEM_PICKUPED,{item : item_id, quantity : cur_amount})
							break
						}
		            }
			}
		    cur_slot ++;
	
		if cur_amount==max_amount
		{
			exit
		}
	
		if cur_slot==obj_inventory.inventory_size
		{
			if instance_exists(obj_player){
				with instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_item){
					whatitem=item_id
					amount=max_amount-cur_amount
				}
			}
			exit
		}
	}
}
	
///@description check_requirement_item()
/*
	Check inventory for needed item, this can use not only for quests. For example: this can use
	in dialogue system, to add an option in the dialog box if there is an item.
*/
function check_requirement_item(inventory, item, itemamount) {
	var findedamount = 0
	var thereitems = false
	for(i=0;i<ds_grid_width(inventory);i++){
		if inventory[# i,0]==item{
			findedamount+=inventory[# i,1]
			if findedamount>=itemamount{
				thereitems=true	
			}
		}
	}
	return thereitems
}

function get_item_quantity(inventory, item) {
	var findedamount = 0
	for(i=0;i<ds_grid_width(inventory);i++){
		if inventory[# i,0]==item{
			findedamount+=inventory[# i,1]
		}
	}
	return findedamount
}
	
	
/// @description Grab items from player inventory
/// @function item_grab(item,amount)
/// @param item_id
/// @param amount
function item_grab(item_id,itemamount,inventory) {
	if !check_requirement_item(inventory,item_id,itemamount) exit
	var findedamount = 0

	for(var n=0;n<ds_grid_width(inventory);n++)//Check inventory
	{
		if inventory[# n,0]==item_id//If slot equal needed item
		{
			var items_in_slot = inventory[# n,1]
			for (var i=0;i<items_in_slot;i++)//Get slot item amount and grab item
			{
				findedamount++
				inventory[# n,1]--

				if inventory[# n,1] == 0 {inventory[# n,0]=NO_ITEM}
				if findedamount==itemamount
				{
					event_fire(EVENT_NPC_DELIVER,{item : inventory[# n,1], quantity : findedamount})
					return true
				}
			}
		}
	}
	return false
}


/// @description Modifies a slot in the inventory. Can add and remove items, and set the item.
/// @function slot_modify_amount(invetory, slot, amount, override);
function slot_modify_amount(inventory, slot, amount, override) {
	if (override == false) //If it is not overriding current values
	{
		inventory[# slot, 1] += amount; //Increase amount by input amount
	}
	else //If it is overriding current values
	{
		inventory[# slot, 1] = amount; //Set amount to input amount
	}

	//Clear slot if the amount is less than or equal to 0
	if (inventory[# slot, 1] <= 0)
	 {
		inventory[# slot, 0] = NO_ITEM;
		inventory[# slot, 1] = 0;
	}
}


