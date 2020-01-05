/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_player)
	{
	if point_distance(obj_player.x,obj_player.y,x,y)<20
	{
		if obj_controller.action_key
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
	else
	{
		guistate="isClose"
		obj_inventory.inventorylock=false
	}
}	