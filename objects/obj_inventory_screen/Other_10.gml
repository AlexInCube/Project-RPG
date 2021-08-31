//Calculate the slot coordinates, based on the parameters above
var iy = 0
var ix = 0
var ii = 0
for(i=0;i<inventory_size;i++)
{
	slotsxy[i,0] = inventory_x+slots_x+((cell_size+x_buffer)*ix)
	slotsxy[i,1] = inventory_y+slots_y+((cell_size+y_buffer)*iy)
	ii++
	ix = ii mod 5
	iy = ii div 5
}

equipslotsxy[0,0] = equipment_x+6
equipslotsxy[0,1] = equipment_y+2
equipslotsxy[0,2] = ITEM_TYPE_HELMET
equipslotsxy[1,0] = equipment_x+40
equipslotsxy[1,1] = equipment_y+2
equipslotsxy[1,2] = ITEM_TYPE_CHESTPLATE
equipslotsxy[2,0] = equipment_x+74
equipslotsxy[2,1] = equipment_y+2
equipslotsxy[2,2] = ITEM_TYPE_LEGGINGS
equipslotsxy[3,0] = equipment_x+108
equipslotsxy[3,1] = equipment_y+2
equipslotsxy[3,2] = ITEM_TYPE_BOOTS
equipslotsxy[4,0] = equipment_x+142
equipslotsxy[4,1] = equipment_y+2
equipslotsxy[4,2] = ITEM_TYPE_WEAPON