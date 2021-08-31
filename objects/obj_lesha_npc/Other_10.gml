reset_dialogue_defaults();

switch(choice_variable){
	case -1:
		var i = 0;
		//Line 0
		myText[i]		= "Хотите что-нибудь прикупить?";
		mySpeaker[i]	= id;
		//Line 1
		i++;
		myText[i]		= [DIALOGUE_MACRO_TRADE+"Показывай что у тебя есть","Где я могу подзаработать денег?","В другой раз"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= [2,3,-1];
		//Line 2
		i++
		myText[i]		= "Выбирай что хочешь, только лучший товар!";
		myScripts[i]	= [open_trade_window,trade_arr,myName]
		mySpeaker[i]	= id;
		//Line 3
		myText[i]		= "На работе, где же ещё?";
		mySpeaker[i]	= id;
		//Line 4
		i++;
		myText[i]		= ["Это и так очевидно, можно по конкретнее?", ""];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= [2,3,-1];
	break;
}