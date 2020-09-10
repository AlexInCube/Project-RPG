/// @description Modifies a slot in the inventory. Can add and remove items, and set the item.
/// @function slot_modify_amount(slot, amount, override);
/// @param slot
/// @param amount
/// @param override
function slot_modify_amount(argument0, argument1, argument2) {

	//Assign local variables
	var slot = argument0;
	var amount = argument1;
	var override = argument2;

	if (override == false) //If it is not overriding current values
	 {
		global.inventory[# slot, 1] += amount; //Increase amount by input amount
		}
	else //If it is overriding current values
	 {
		global.inventory[# slot, 1] = amount; //Set amount to input amount
		}

	//Clear slot if the amount is less than or equal to 0
	if (global.inventory[# slot, 1] <= 0)
	 {
		global.inventory[# slot, 0] = item.none;
		global.inventory[# slot, 1] = 0;
		}


}
