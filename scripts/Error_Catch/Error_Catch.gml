exception_unhandled_handler(function (ex){
	show_debug_message( "--------------------------------------------------------------");
    show_debug_message( "Unhandled exception " + string(ex) );
    show_debug_message( "--------------------------------------------------------------");
    if file_exists("crash.txt") file_delete("crash.txt");
    var _f = file_text_open_append("crash.txt");
    file_text_write_string(_f, string(ex));
    file_text_close(_f);
	sentry_capture_exception(ex.longMessage)
	
	var _s = "Sorry, but game is crashed!"+"\n"+"If you have internet connection, this crash log is automatically sended to developer."+"\n\n"+string(ex)
	
    show_message(_s)
})