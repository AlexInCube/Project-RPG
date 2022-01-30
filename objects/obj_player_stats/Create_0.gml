create_buff_grid()

stats = new Player_Stats()

invisibility_duration = 60//ticks

last_hit=""


function Die(){
	if !instance_exists(obj_player_corpse){
		instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_player_corpse)
		obj_player_corpse.killer=obj_player_stats.last_hit
	}
	instance_destroy(obj_player)
}

recalculate_stats(global.equipment)



expr=0//Player current xp
max_expr=3//Player need xp to level up
level=1//Player Level
attribute_points=0//Skillpoint for level up player stats

lvlword=find_keyword("level")
expword=find_keyword("experience")

txtcolor=c_white

//X coords relative to fast use block
fast_slots[0] = 0
fast_slots[1] = 34
fast_slots[2] = 68
fast_slots[3] = 102
fast_slots[4] = 138

//Effects system
draw_effect_start_x = 180

function draw_effect(xx,yy,grid,effect_id){
	var _effect_struct = return_struct_from_effect_index_by_effect_id(grid[# effect_id,0])
		if _effect_struct != -1 and !is_undefined(_effect_struct){
			var _effect_icon = _effect_struct[$ "effect_icon"]
			var _effect_type = _effect_struct[$ EFFECT_IS_BUFF]
			draw_sprite(_effect_icon,0,xx,yy)
			draw_sprite(spr_effect_frame,_effect_type,xx,yy)
			var _duration = convert_ticks_to_seconds(grid[# effect_id,1][$ "duration"])
			draw_set_halign(fa_left)
			draw_set_valign(fa_top)
			draw_text_shadow(xx,yy+10,round(_duration),fnt_small,1,c_black,c_white,1)
			if DEBUGMODE{
				draw_text_shadow(xx,yy,(grid[# effect_id,1][$ "tick"]),fnt_small,1,c_black,c_white,1)
			}
			if mouseover(xx,yy,xx+32,yy+32){
				var txt = _effect_struct[$ "effect_locale_name"]+"\n"+_effect_struct[$ "effect_description"]
				draw_text_hover(txt,spr_hover_item_description,c_white,fa_center)
			}
		}
}