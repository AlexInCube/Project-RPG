function registereffects(){
	register_effect("regeneration",spr_effect_regeneration,EFFECT_TYPE_BUFF,regeneration_effect,[])
	
	show_debug_message("Registered "+string(ds_list_size(global.effect_index))+" effects")
}