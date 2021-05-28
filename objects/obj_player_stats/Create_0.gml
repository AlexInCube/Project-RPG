create_buff_grid()

max_hp=5
hp=max_hp

energy=5//Increase max_mana
max_mana=5
mana=max_mana

defense=5//Gain phys and magic armor, also increase max_hp
phys_armor=0
magic_armor=0

strength=0//Gain phys and mag damage
phys_damage=0
magic_damage=0

agility=0//Gain evasion and hp/mp regen amount (for example potion heal 1*agility hp)
evasion=0
regen_amount=0

invisibility_duration = 60//ticks

last_hit=""

recalculate_stats(global.equipment)

/*
ds_map_add(global.stats,"phys_damagebuff",0)
ds_map_add(global.stats,"magic_damagebuff",0)
ds_map_add(global.stats,"physresistance",0)
ds_map_add(global.stats,"magicresistance",0)
ds_map_add(global.stats,"physresistancebuff",0)
ds_map_add(global.stats,"magicresistancebuff",0)
ds_map_add(global.stats,"strength",0)//inscrease physical damage resistance and physical damage deal
ds_map_add(global.stats,"intelligence",0)//inscrease magical damage resistance and magical damage deal
*/



expr=0//Player current xp
max_expr=3//Player need xp to level up
level=1//Player Level
attribute_points=0//Skillpoint for level up player stats

lvlword=find_keyword("level")
expword=find_keyword("experience")

txtcolor=c_white

function draw_bar(xx,yy,_value,_max,_color){
	draw_sprite_ext(spr_borderbar,0,xx,yy,1,1,0,c_white,1)
	var bar_spr = spr_hpbar
	var bar_spr_width = sprite_get_width(bar_spr)
	draw_sprite_part_ext(bar_spr,0,0,0,bar_spr_width*(_value/_max),sprite_get_height(bar_spr),xx,yy,1,1,_color,1)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(txtcolor)
	draw_text(xx+(bar_spr_width/2),yy+4,string(_value)+"/"+string(_max))
}

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
				draw_effect_stat_mouse(_effect_struct)
			}
		}
}