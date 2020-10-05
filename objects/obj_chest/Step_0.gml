/// @description Insert description here
// You can write your code in this editor
if (obj_controller.inventory_key or obj_controller.interact_key) and guiid!=0
{
	guiid=0
}else if obj_controller.interact_key and guiid==0{
	if collision_rectangle(x-findradius,y-findradius,x+findradius,y+findradius,obj_player,false,false)
	{
		guiid=create_window(spr_inventorymenu,chestname,0,0,inventoryscreen,[chestinventory])
	}
}	

