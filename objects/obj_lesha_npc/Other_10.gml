reset_dialogue_defaults();

switch(choice_variable){
	case -1:
		var i = 0;
		//Line 0
		myText[i]		= "Хотите что-нибудь прикупить?";
		mySpeaker[i]	= id;
		//Line 1
		i++;
		myText[i]		= ["Да","Нет"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myScripts[i]	= [[open_trade_window,trade_arr,myName],[nothing]]
		myNextLine[i]	= [-1,-1];
	break;
}