reset_dialogue_defaults();


switch(image_index){
	case 0:
	#region First Dialogue
		var i = 0;
		//Line 0
		myText[i]		= ["Взять оружие","Уйти"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= -1
		myScripts[i]	= [[scr_trophy_gun_furniture],[nothing]]
		#endregion
	break;
}