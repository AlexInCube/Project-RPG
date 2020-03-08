/// @description Insert description here
// You can write your code in this editor
if (obj_controller.inventory_key or obj_controller.interact_key) and guistate="isOpen"
{
	guistate="isClose"
	obj_inventory.inventorylock=false
}else if obj_controller.interact_key and guistate="isClose"
	{
	if collision_rectangle(x-findradius,y-findradius,x+findradius,y+findradius,obj_player,false,false)
	{
		guistate="isOpen"
		obj_inventory.inventorylock=true
	}
}	

