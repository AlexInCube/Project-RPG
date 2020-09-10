reset_dialogue_defaults();


switch(choice_variable){
#region Ny chto ne zhdali?
	case 0:
		//Line 0
		var i = 0;
		myText[i]		= "Не ждал что я прийду? А я пришёл.";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1
		myScripts[i]	= [penguin_not_wait]
	break;
#endregion
#region First Dialogue
	case -1:
		//Line 0
		var i = 0;
		myText[i]		= "Ну что с деньгами?";
		mySpeaker[i]	= id;
		//Line 1
		i++;
		myText[i]		= ["С какими деньгами?","Прекратить разговор"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= [2,3];
		if check_requirement_item(global.equipment,item.shotgun,1){
			array_set(myText[i],2,"Пригрозить оружием")
			array_set(myNextLine[i],2,4)
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
		//Line 4
		i++;
		myText[i]		= "АААААААААААААААА";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1;
		myScripts[i]	= [angry_penguin]
	break;
#endregion
}