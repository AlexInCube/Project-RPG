if story_tag_exist("bush_destroyer"){
	instance_destroy()
}
event_register([event.itemPickuped,"wooden_stick",1],id,instance_destroy_ext,id,true)
t_scene_info = [
	[cutscene_take_player_control],
	[cutscene_change_interface_state,true],
	[cutscene_create_monologue,"Я не могу пока-что тут пройти."],
	[cutscene_move_character,obj_player,0,30,true,obj_player.spd],
	[cutscene_set_to_default]
]