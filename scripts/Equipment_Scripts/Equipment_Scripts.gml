function equip_basic_button_scr(){
	equipmode = 0
}

function equip_advanc_button_scr(){
	equipmode = 1
}

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
	with(obj_player_stats){
			phys_armor = pa + defense
			magic_armor = ma + defense
			phys_damage = pd + strength
			magic_damage = md + strength
			evasion = agility
			regen_amount = agility
			max_hp = defense
			max_mana = energy
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
			script_execute(weapon_create_script)
		}
	}
}
