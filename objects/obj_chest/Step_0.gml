/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_player)
	{
	if collision_rectangle(x-findradius,y-findradius,x+findradius,y+findradius,obj_player,false,false)
	{
		if obj_controller.interact_key
		{
			if obj_inventory.inventorylock=false and guistate="isClose"
			{
				guistate="isOpen"
				obj_inventory.inventorylock=true
			}
			else
			{
				guistate="isClose"
				obj_inventory.inventorylock=false
			}
		}
	}
}	