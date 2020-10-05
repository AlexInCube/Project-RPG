//Hotbar item using
function slot_script_execute(argument0, argument1) {
	var inventory = argument0
	var slot_id = argument1

	if global.item_index[# inventory[# slot_id,0],item_stat.action_script]>0//If item have script
		{
			if global.item_index[# inventory[# slot_id,0],item_stat.type]==item_type.potion//If item potion
			{
			script_execute(global.item_index[# inventory[# slot_id,0],item_stat.action_script])
			inventory[# slot_id,1]-=1//Decrease quantity
			if inventory[# slot_id,1]<=0//If quantity = 0, then remove item
				{
					inventory[# slot_id,0]=item.none
				}
			}
		
			if global.item_index[# inventory[# slot_id,0],item_stat.type]==item_type.spell//If item spell scroll
			{
				var spell = global.item_index[# inventory[# slot_id,0],item_stat.action_script]
				var manacost = global.item_index[# inventory[# slot_id,0],item_stat.manacost]
				script_execute(spell,manacost)
			
			}
		}
	}
