//Inventory Screen for Player/Chests inventories
var windowid = id
var inventory = argument0
var inventory_size = ds_grid_width(inventory)
var slotsxy
var cell_size=32
var slots_x=8
var slots_y=32
var x_buffer=1
var y_buffer=1
var window_xx=windowid.window_x
var window_yy=windowid.window_y
var iy = 0
var ix = 0
var ii = 0//Number of slots drawed

for(i=0;i<inventory_size;i++)
{
	//Calculate coordinates for each slot
	slotsxy[i,0] = window_xx+slots_x+((cell_size+x_buffer)*ix)
	slotsxy[i,1] = window_yy+slots_y+((cell_size+y_buffer)*iy)
	ii++
	ix = ii mod 2
	iy = ii div 2
	//Draw sprite from item in slot
		if inventory[# i, 0]!=item.none
		{
			draw_sprite(global.item_index[# inventory[# i, 0], item_stat.sprite_index],1,slotsxy[i,0]+16,slotsxy[i,1]+16)
		}
		//Draw item amount if item amount in slots more than 1
		if inventory[# i, 1]>1
		{
			draw_text(slotsxy[i,0]+2,slotsxy[i,1]+12,inventory[# i, 1])
		}
	
	if windowid.placefree{
		scr_slot(inventory,i,slotsxy[i,0],slotsxy[i,1])
	}
}

if windowid.placefree{
	for(i=0;i<inventory_size;i++)
	{
	if inventory[# i, 0]!=item.none
		{
			if scr_mouseover(slotsxy[i,0],slotsxy[i,1],slotsxy[i,0]+32,slotsxy[i,1]+32)
			{
				scr_draw_item_stat_mouse(inventory,i)
			}
		}
	}
}

draw_text(window_xx+92,window_yy+28,obj_player_stats.maxhp)
draw_text(window_xx+92,window_yy+44,obj_player_stats.maxmana)
draw_text(window_xx+92,window_yy+60,obj_player_stats.physarmor)
draw_text(window_xx+92,window_yy+76,obj_player_stats.magicarmor)
draw_text(window_xx+92,window_yy+92,obj_player_stats.attack)
draw_text(window_xx+92,window_yy+108,obj_player_stats.magicattack)
draw_text(window_xx+140,window_yy+28,obj_player_stats.maxhp)