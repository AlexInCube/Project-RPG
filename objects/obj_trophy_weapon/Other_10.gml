reset_dialogue_defaults();


switch(weapon_taked){
	case false:
	#region First Dialogue
		var i = 0;
		//Line 0
		myText[i]		= ["Взять оружие","Уйти"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= -1
		myScripts[i]	= [[trophy_gun_furniture],[nothing]]
	break;
	#endregion
}