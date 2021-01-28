#macro BUFF_REGENERATION "buff_regeneration"
#macro BUFF_ATTACK "buff_attack"
#macro BUFF_DEFENSE "buff_defense"
#macro UNKNOWN_EFFECT "unknown_effect"
function registereffects(){
	register_effect(BUFF_REGENERATION ,spr_effect_regeneration,regeneration_effect)
	register_effect(BUFF_ATTACK,spr_effect_attack,attack_effect)
	register_effect(BUFF_DEFENSE,spr_effect_defense,defense_effect)
	show_debug_message("Registered "+string(ds_list_size(global.effect_index))+" effects")
}