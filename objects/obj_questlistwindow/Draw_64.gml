// Inherit the parent event
draw_set_font(fnt_small)
draw_set_halign(fa_middle)
draw_set_valign(fa_top)
draw_sprite(window_sprite,0,window_x,window_y-22)
draw_set_color(c_black)
draw_text(window_x+169,window_y+35,window_name)
draw_set_halign(fa_left)
var ds_height = ds_grid_height(obj_questmanager.ds_quests)

	var i=0;repeat(ds_height){
		if scr_quest_get_current_stage(i)> -1{
			draw_text(window_x+5,window_y+56+(20*i),string(scr_quest_get_name(i))+":"
			+string(scr_quest_get_current_stage(i))+"/"+string(scr_quest_get_task_amount(i)+1))
		}
		i++
	}
