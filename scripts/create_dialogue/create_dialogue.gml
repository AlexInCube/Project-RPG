///@description create_dialogue
///@arg Text
///@arg Speaker
///@arg *Type
///@arg *Next_Line
///@arg *Scripts
///@arg *Emotion
function create_dialogue() {


	if(instance_exists(obj_textbox)){ exit; }
	//Get Arguments
	var arg = 0, i = 0, arg_count = argument_count;
	repeat(arg_count){ arg[i] = argument[i]; i++; } 

	//Get arguments
	var _text = arg[0];
	if _text == -1{exit}
	
	
	//Create the Textbox
	var _textbox = instance_create_layer(x,y, "Text", obj_textbox);
	
	var _speaker, text_len;

	//If Text or Speaker aren't arrays (single line input), make them arrays 
	if(is_array(_text))		{ text_len = array_length(_text); }
	else					{ text_len = 1; _text[0] = _text;  }
	if(!is_array(arg[1]))	{ _speaker = array_create(text_len, id); }
	else					{ _speaker = arg[1]; }

	//Get rest of arguments, fill with default
	var _type		= array_create(text_len, 0);
	var _nextline	= array_create(text_len, 0);
	var _script		= array_create(text_len, 0);
	var _emotion	= array_create(text_len, 0);
	var _creator	= array_create(text_len, id);



	var a;
	//Fill variables depending on argument count
	switch(arg_count-1){
		case 5: a = arg[5]; if(array_length(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _emotion[i] = a[i]; }
		case 4: a = arg[4];	if(array_length(a) != text_len){ a[text_len] =-1; } for(i = 0; i < text_len; i++){ if(a[i] !=-1) _script[i] = a[i]; }
		case 3: a = arg[3];	if(array_length(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _nextline[i] = a[i]; }
		case 2: a = arg[2];	if(array_length(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _type[i] = a[i]; }
	}

	//Change the Textbox Values
	with(_textbox){
		creator		= _creator;
		type		= _type;
		text		= _text;
		nextline	= _nextline;
		executeScript = _script;
		emotion		= _emotion;	
	
		//Speaker's Variables
		i = 0; repeat(text_len){
			portrait[i]			= _speaker[i].myPortrait;
			voice[i]			= _speaker[i].myVoice;
			font[i]				= _speaker[i].myFont;
			name[i]				= _speaker[i].myName;
			speaker[i]			= _speaker[i];
			i++;
		}
	
		draw_set_font(font[0]);
		charSize = string_width("M");
		stringHeight = string_height("M");
		event_perform(ev_alarm, 0);	//makes textbox perform "setup"
	}

	myTextbox = _textbox;
	return _textbox;


}