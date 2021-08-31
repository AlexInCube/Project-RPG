function recalculate_stats(inventory) {
	var ds_width = ds_grid_width(inventory)
	var pa=0,ma=0,pd=0,md=0
	for(var i=0;i<ds_width;i++){
		var _item_struct = return_struct_from_item_index_by_item_inv(inventory,i)
		if _item_struct != undefined{
			if _item_struct[$ "phys_armor"]!= undefined pa = pa + _item_struct[$ "phys_armor"]
			if _item_struct[$ "magic_armor"]!= undefined ma = ma + _item_struct[$ "magic_armor"]
			if _item_struct[$ "phys_damage"]!= undefined pd = pd + _item_struct[$ "phys_damage"]
			if _item_struct[$ "magic_damage"]!= undefined md = md + _item_struct[$ "magic_damage"]
		}
	}
	with(obj_player_stats.player_stats){
			phys_armor.addModifier([modifier_type.constant,pa + defense.getValue()])
			magic_armor.addModifier([modifier_type.constant,ma + defense.getValue()])
			phys_damage.addModifier([modifier_type.constant,pd + strength.getValue()])
			magic_damage.addModifier([modifier_type.constant,md + strength.getValue()])
			evasion.addModifier([modifier_type.constant,agility.getValue()])
			regen_multiplier.addModifier([modifier_type.constant,agility.getValue()])
			max_hp.addModifier([modifier_type.constant,max_hp.getValue()+defense.getValue()])
			max_mana.addModifier([modifier_type.constant,max_mana.getValue()+energy.getValue()])
			//strength = str
		}
	weapon_equip()
}


/// @description Create weapon object from item in hand
/// @function weapon_equip();
function weapon_equip() {
	instance_destroy(obj_weapon_controller)
	var _item_struct = return_struct_from_item_index_by_item_inv(global.equipment,4)
	if !instance_exists(obj_weapon_controller) and global.equipment[# 4, 0] != NO_ITEM and _item_struct[$ "item_type"] == ITEM_TYPE_WEAPON{
		var inst = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_weapon_controller)
		with(inst){
			weapon_create_script = _item_struct[$ "weapon_create_script"]
			script_execute_ext(weapon_create_script,[global.equipment,4])
		}
	}
}
