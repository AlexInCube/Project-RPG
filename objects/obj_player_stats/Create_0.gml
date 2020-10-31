/// @description Insert description here
// You can write your code in this editor

hp=10
max_hp=10

energy=0//Increase max_mana
mana=10
max_mana=10

defense=0//Gain phys and magic armor, also increase max_hp
phys_armor=0
magic_armor=0

strength=0//Gain phys and mag damage
phys_damage=0
magic_damage=0

agility=0//Gain evasion and hp/mp regen amount (for example potion heal 1*agility hp)
evasion=0
regen_amount=0


last_hit=""



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