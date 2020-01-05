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

 while inv[# cur_slot, 0] != item.none{cur_slot++}
  while (cur_slot < max_slot)
  {
      if (inv[# cur_slot, 0] == item_id) || (inv[# cur_slot, 0] == item.none)
      {
          inv[# cur_slot, 0] = item_id;
          while (cur_amount < max_amount)
          {
            if inv[# cur_slot, 1] < item_ind[# item_id, total]
            {
              inv[# cur_slot, 1] += 1;
			  cur_amount += 1
              if inv[# cur_slot, 1] == item_ind[# item_id, total]
              {
                cur_slot ++;
                
                break;
              }
            }								
            
          }
      }
	  if cur_amount>=max_amount{exit}
      cur_slot ++;
	}
 