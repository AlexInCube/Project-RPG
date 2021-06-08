reset_dialogue_defaults();

switch(choice_variable){
	case -1:
		var i = 0;
		//Line 0
		myText[i]		= "Хотите что-нибудь прикупить?";
		mySpeaker[i]	= id;
		//Line 1
		i++;
		myText[i]		= [DIALOGUE_MACRO_TRADE+"Что-нибудь можно взять","В другой раз"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= [2,-1];
		//Line 2
		i++
		myText[i]		= "Выбирай что хочешь, только лучший товар!";
		myScripts[i]	= [open_trade_window,trade_arr,myName]
		mySpeaker[i]	= id;
	break;
}