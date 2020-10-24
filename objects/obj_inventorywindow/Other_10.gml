//Calculate the slot coordinates, based on the parameters above
var iy = 0
var ix = 0
var ii = 0
for(i=0;i<inventory_size;i++)
{
	slotsxy[i,0] = window_x+slots_x+((cell_size+x_buffer)*ix)
	slotsxy[i,1] = window_y+slots_y+((cell_size+y_buffer)*iy)
	ii++
	ix = ii mod 5
	iy = ii div 5
}