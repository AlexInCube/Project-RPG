/// @description Modifies a slot in the inventory. Can add and remove items, and set the item.
/// @function scr_gain_item(slot, amount);
/// @param item_id
/// @param amount

var item_id    = argument0;
 var max_amount = argument1;
var inv        = global.inventory; 
var item_ind   = global.item_index;
var total      = item_stat.stackable;
var cur_amount = 0
var cur_slot   = 0;
var max_slot   = ds_grid_width(inv);



while (cur_slot < max_slot)
{
	
	if (inv[# cur_slot, 0] == item_id) || (inv[# cur_slot, 0] == item.none)
		{
				while (cur_amount < max_amount)
				{
					if inv[# cur_slot, 1] != item_ind[# item_id, total]
					{
						inv[# cur_slot, 0] = item_id;
						inv[# cur_slot, 1] += 1;
						cur_amount += 1
					}
					else
					{
						break
					}
	            }
		}
	     cur_slot ++;
	
	if cur_amount==max_amount
	{
		exit
	}
	
	if cur_slot==30
	{
		var xx=obj_player.x
		var yy=obj_player.y
		var itemdropped=instance_create_layer(xx,yy,"Instances",obj_item)
		itemdropped.whatitem=item_id
		itemdropped.amount=max_amount-cur_amount
		exit
	}
	show_debug_message(string(cur_amount)+"slot:"+string(cur_slot))
}

