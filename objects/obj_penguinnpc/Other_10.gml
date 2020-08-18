reset_dialogue_defaults();


switch(choice_variable){
	case -1:
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "Ну что с деньгами?";
		mySpeaker[i]	= id;
		#endregion
		//Line 1
		i++;
		myText[i]		= ["С какими деньгами?","Прекратить разговор"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= [2,3];
		if scr_check_requirement_item(global.armor_equipped,item.shotgun,1){
			array_set(myText[i],2,"Пригрозить оружием")
			array_set(myNextLine[i],2,-1)
		}
		//Line 2
		i++;
		myText[i]		= "Давай не начинай прикидываться, где деньги которые я вложил?";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1;
		//Line 3
		i++;
		myText[i]		= "Куда ты? Мы ещё не поговорили толком";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1;
		
	break;
}