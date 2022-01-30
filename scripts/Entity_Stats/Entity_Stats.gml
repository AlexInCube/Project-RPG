enum modifier_type{
	constant,
	multiplier
}

function Stat(baseVal) constructor{
	baseValue = baseVal
	finalValue = baseVal
	modifiers = ds_map_create()
		//[modifier_type.constant,10]
		/*
		ds_map_create()
		item_id is also modifier_id
		item provide args
		modifier_id = [modifiers_args] 
		*/
	
	
	static getValue = function(){
		return finalValue
	}
	
	static setBaseValue = function(value){
		baseValue = value
		stat_recalculate()
	}
	
	static addModifier = function(modifier_id,stats){
		modifiers[? modifier_id] = stats
		stat_recalculate()
	}
	
	static removeModifier = function(modifier_id){
		ds_map_delete(modifiers,modifier_id)
		stat_recalculate()
	}
	
	static removeAllModifiers = function(){
		ds_map_clear(modifiers)
		stat_recalculate()
	}
}
///@description Use this only for player stats
function StatExt(baseVal,statName,statIcon) : Stat(baseVal) constructor{
	stat_name = find_keyword(statName)
	stat_description = find_keyword(statName + "_description")
	stat_icon = find_keyword(statIcon)
}

function stat_recalculate(){
	var constant_val = 0
	var percent_val = 1
	var key = ds_map_find_first(modifiers)
	
	for(var i = 0;i<ds_map_size(modifiers);i++){
		var modifier = modifiers[? key]
		switch(modifier[@ 0]){
			case modifier_type.constant:
				constant_val += modifier[@ 1]
			break
			
			case modifier_type.multiplier:
				percent_val += modifier[@ 1]
			break
		}
		key = ds_map_find_next(modifiers,key)
	}
	finalValue = (baseValue + constant_val)*percent_val
}

function Player_Stats() constructor{
	max_hp = new StatExt(10,"max_health",spr_staticonhp)
	hp_regen = new StatExt(0,"health_regen",spr_staticonhp)
	hp = max_hp.getValue()

	max_mana = new StatExt(5,"max_mana",spr_staticonmana)
	mana_regen = new StatExt(0,"mana_regen",spr_staticonmana)
	mana = max_mana.getValue()

	phys_armor = new StatExt(0,"phys_armor",spr_staticonphysarmor)
	magic_armor = new StatExt(0,"magic_armor",spr_stat_icon_magic_armor)

	phys_damage = new StatExt(0,"phys_damage",spr_stat_icon_attack)
	magic_damage = new StatExt(0,"magic_damage",spr_staticonmagicattack)

	evasion = new StatExt(0,"evasion",spr_staticonluck)
	regen_multiplier = new StatExt(0,"regen_multiplier",spr_staticonhp)
}

function Entity_Stats() constructor{
	max_hp = new Stat(1)
	hp_regen = new Stat(0)
	hp = max_hp.getValue()


	max_mana = new Stat(0)
	mana_regen = new Stat(0)
	mana = max_mana.getValue()

	phys_armor = new Stat(0)
	magic_armor = new Stat(0)

	phys_damage = new Stat(0)
	magic_damage = new Stat(0)

	evasion = new Stat(0)
	regen_multiplier = new Stat(0)
}

//StatListDelete need for clear memory, after enemy dies.
function Stat_List_Delete(list){
	var stat_names_arr = variable_struct_get_names(list)
	for(var i = 0;i < array_length(stat_names_arr);i++){
		if typeof(list[$ stat_names_arr[i]]) == "struct"{
			with list[$ stat_names_arr[i]]{
				ds_map_destroy(modifiers)
			}
			delete list[$ stat_names_arr[i]]
		}
	}
	delete list
}