draw_self()
effect_cycle_grid(id)

if obj_inputManager.addition_key{
	draw_healthbar(phy_position_x-10,phy_position_y-10,phy_position_x+10,phy_position_y-5,(stats.max_hp.getValue()/stats.hp)*100,c_black,c_red,c_green,0,true,true)
}