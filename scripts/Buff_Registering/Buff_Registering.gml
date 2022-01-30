#macro BUFF_REGENERATION "buff_regeneration"
#macro BUFF_ATTACK "buff_attack"
#macro BUFF_DEFENSE "buff_defense"
#macro BUFF_INVISIBLE "buff_invisible"
#macro UNKNOWN_EFFECT "unknown_effect"
function register_effects(){
	global.effect_index = ds_list_create()
	
	register_effect(BUFF_INVISIBLE,spr_effect_invisible,invisible_player_effect)
	register_effect(BUFF_REGENERATION ,spr_effect_regeneration,regeneration_effect)
	register_effect(BUFF_ATTACK,spr_effect_attack,attack_effect)
	register_effect(BUFF_DEFENSE,spr_effect_defense,defense_effect)

	
	console_log("Registered "+string(ds_list_size(global.effect_index))+" effects")
}