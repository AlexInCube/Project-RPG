#macro BUFF_REGENERATION "buff_regeneration"
#macro BUFF_ATTACK "attack"
function registereffects(){
	register_effect(BUFF_REGENERATION ,spr_effect_regeneration,regeneration_effect,[])
	register_effect(BUFF_ATTACK,spr_effect_attack,attack_effect,[])
	show_debug_message("Registered "+string(ds_list_size(global.effect_index))+" effects")
}