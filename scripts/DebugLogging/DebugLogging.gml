function get_timestamp(){
	var date = date_current_datetime()
	return "["
			+ string(get_formatted_date(date_get_day(date))) + "/" 
			+ string(get_formatted_date(date_get_month(date))) + "/" 
			+ string(date_get_year(date)) + "  " 
			+ string(get_formatted_date(date_get_hour(date))) + ":" 
			+ string(get_formatted_date(date_get_minute(date))) + ":" 
			+ string(get_formatted_date(date_get_second(date)))
			+ "] "
}

function console_log(_message){
	show_debug_message(get_timestamp()+string(_message))
}