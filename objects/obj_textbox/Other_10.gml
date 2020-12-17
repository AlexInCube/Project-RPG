var cv = executeScript[page];
if(is_array(cv)){
	var len = array_length(cv)-1;
	var cva = array_create(len, 0);
	array_copy(cva, 0, cv, 1, len);
	script_execute_ext(cv[0], cva);
}