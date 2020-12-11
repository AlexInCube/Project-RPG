

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


last_hit=""

//recalculate_stats(global.equipment)

/*
ds_map_add(global.stats,"physdamagebuff",0)
ds_map_add(global.stats,"magicdamagebuff",0)
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
	draw_text_color(xx+(bar_spr_width/2),yy+4,string(_value)+"/"+string(_max),txtcolor,txtcolor,txtcolor,txtcolor,1)
}