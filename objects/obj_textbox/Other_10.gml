name = scr_find_keyword(names[page])
voice = voices[page]
portrait = portraits[page]

if (!is_array(text[page]))
{
	var stringtowrap = scr_find_keyword(text[page])
	text_wrapped = scr_string_wrap(stringtowrap,text_max_width)
	str_len = string_length(text_wrapped)
	choice_dialogue = false
} 
else 
{
	text_array = text[page]
	text_array_len = array_length_1d(text_array)
	choice_dialogue = true
}

counter=0