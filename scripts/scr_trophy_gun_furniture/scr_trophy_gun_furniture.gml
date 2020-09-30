function trophy_gun_furniture() {
	gain_item(item.shotgun,1)
	audio_play_sound(snd_shotgun_prepare,1,0)
	change_variable(obj_trophy_weapon,"weapon_taked",1)


}
