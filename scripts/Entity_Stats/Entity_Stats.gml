enum modifier_type{
	constant,
	multiplier
}

function Stat(baseVal) constructor{
	baseValue = baseVal
	finalValue = baseVal
	modifiers = [
		//[modifier_type.constant,10]
	]
	
	static getValue = function(){
		return finalValue
	}
	
	static setValue = function(value){
		baseValue = value
		stat_recalculate()
	}
	
	static addModifier = function(modifier){
		array_push(modifiers,modifier)
		stat_recalculate()
	}
	
	static removeModifier = function(modifier){
		modifiers = array_delete(modifiers,modifier,1)
		stat_recalculate()
	}
}
///@description Use this only for player stats
function StatExt(baseVal,statName,statIcon) : Stat(baseVal) constructor{
	stat_name = find_keyword(statName)
	stat_icon = find_keyword(statIcon)
}

function stat_recalculate(){
	var constant_val = 0
	var percent_val = 1
	for(var i = 0;i<array_length(modifiers);i++){
		var modifier = modifiers[@ i]
		switch(modifier[@ 0]){
			case modifier_type.constant:
				constant_val += modifier[@ 1]
			break
			
			case modifier_type.multiplier:
				percent_val += modifier[@ 1]
			break
		}
	}
	finalValue = (baseValue + constant_val)*percent_val
}

function Player_Stats() constructor{
	max_hp = new StatExt(10,"health",spr_staticonhp)
	hp = max_hp.getValue()

	
	energy = new StatExt(0,"energy",spr_staticonmana)//Increase max_mana
	max_mana = new StatExt(5,"mana",spr_staticonmana)
	mana = max_mana.getValue()

	defense = new StatExt(0,"defense",spr_stat_icon_endurance)//Gain phys and magic armor, also increase max_hp
	phys_armor = new StatExt(0,"physical_armor",spr_staticonphysarmor)
	magic_armor = new StatExt(0,"magical_armor",spr_stat_icon_magic_armor)

	strength = new StatExt(0,"strength",spr_stat_icon_strength)//Gain phys and magic damage
	phys_damage = new StatExt(0,"physical_damage",spr_stat_icon_attack)
	magic_damage = new StatExt(0,"magic_damage",spr_staticonmagicattack)

	agility = new StatExt(0,"agility",spr_staticonluck)//Gain evasion and hp/mp regen amount (for example potion heal 1*agility hp)
	evasion = new StatExt(0,"evasion",spr_staticonluck)
	regen_multiplier = new StatExt(0,"regen_multiplier",spr_staticonhp)
}

function Entity_Stats() constructor{
	max_hp = new Stat(3)
	hp = max_hp.getValue()

	
	energy = new Stat(0)//Increase max_mana
	max_mana = new Stat(0)
	mana = max_mana.getValue()

	defense = new Stat(0)//Gain phys and magic armor, also increase max_hp
	phys_armor = new Stat(0)
	magic_armor = new Stat(0)

	strength = new Stat(0)//Gain phys and magic damage
	phys_damage = new Stat(0)
	magic_damage = new Stat(0)

	agility = new Stat(0)//Gain evasion and hp/mp regen amount (for example potion heal 1*agility hp)
	evasion = new Stat(0)
	regen_multiplier = new Stat(0)
}