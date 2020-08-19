///@description scr_deliver_items(item,amount)
///@arg item
///@arg amount
function scr_deliver_items(argument0, argument1) {
	var inventory = global.inventory
	var itemneed = argument0
	var itemamount = argument1
	var findedamount = 0

	for(n=0;n<ds_grid_width(inventory);n++)//Check player inventory
	{
		if inventory[# n,0]==itemneed//If slot equal needed item
		{
			for (i=0;i<inventory[# n,1];i++)//Get slot item amount and grab item
			{
				findedamount+=1
				inventory[# n,1]-=1
				if inventory[# n,1] == 0 {inventory[# n,0]=item.none}
				if findedamount==itemamount
				{
					scr_event_fire([event.deliver,itemneed,itemamount])
					exit
				}
			}
		}
	}


}
