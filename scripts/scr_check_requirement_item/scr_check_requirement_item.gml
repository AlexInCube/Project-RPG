///@description scr_check_requirement_item(questid)
///@arg inventory
///@arg item
///@arg itemamount
function scr_check_requirement_item(argument0, argument1, argument2) {
	var inventory = argument0
	var item = argument1
	var itemamount = argument2
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
