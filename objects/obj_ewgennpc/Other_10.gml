reset_dialogue_defaults();

switch(choice_variable){
	case -1:
	
	break;
	
	case "saved_from_slimes":
		var i = 0;
		//Line 0
		myText[i]		= "[shake]Уже не могу стоять на ногах[/shake]...";
		mySpeaker[i]	= id;
		//Line 1
		i++;
		myText[i]		= "[shake]Я бегал от них слишком долго, мне нужна[/shake][delay,100].[delay,100].[delay,100].[delay,100][c_blue]попить.";
		mySpeaker[i]	= id;
		//Line 2
		i++;
		myText[i]		= "[shake]Можешь принести мне [/shake][c_blue]воды?";
		mySpeaker[i]	= id;
		//Line 3
		i++;
		myText[i]		= ["Да","Нет"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= [4,5];
		//Line 4
		i++;
		myText[i]		= "[shake]Я дам тебе немного [c_green]денег[/c], чтобы ты пришёл в [c_red]\"Шестёрочку\"[/c] и купил [c_blue]водички[c].";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1
		myScripts[i]	= [method_get_index(wait_water)]
		//Line 5
		i++;
		myText[i]		= "[shake]Почемуууууу [c_red]нееет?";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1
	break
	
	case "wait_water":
		var i = 0
		//Line 0
		myText[i]		= "[shake]Неужели ты принёс [c_blue]водичку?";
		mySpeaker[i]	= id;
		//Line 1
		i++;
		myText[i]		= ["Нет"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= [2];
		myScripts[i]	= [[placeholder]]
		if check_requirement_item(global.inventory,"wooden_water_bucket",1){
			array_push(myText[i],"Да")
			array_push(myNextLine[i],3)
			array_push(myScripts[i],[method_get_index(drink_water)])
		}
		//Line 2
		i++
		myText[i]		= "[shake][c_red]ЧТО ТЫ ЗДЕСЬ забыл ТОГДААААААААааааааа.....";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1
		//Line 3
		i++
		myText[i]		= "[c_green]Спасибо";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1
	break;
	
	case "drink_water":
		var i = 0
		//Line 0
		myText[i]		= "Иди гуляй";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1
	break;
}