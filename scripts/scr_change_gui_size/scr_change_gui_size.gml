///@description change_gui_size
///@arg guisize
function change_gui_size() {
	var display_height=global.settings.video.height,display_width=global.settings.video.width
	var ideal_width=1280;
	var ideal_height=720;


	if argument_count == 1{
		global.settings.interface.guisize=argument[0];
	}else{
		if argument_count == 2{
		global.settings.interface.guisize=argument[1]; 
		}
	}



	var aspect_ratio=display_width/display_height;

	ideal_width=round(ideal_height*aspect_ratio);
	ideal_height=round(ideal_width / aspect_ratio);

	//Perfect Pixel Scaling
	if(display_width mod ideal_width != 0)
	{
	  var d = round(display_width/ideal_width);
	  ideal_width=(display_width/d)/global.settings.interface.guisize;
	}
	if(display_height mod ideal_height != 0)
	{
	  var d = round(display_height/ideal_height);
	  ideal_height=(display_height/d)/global.settings.interface.guisize;
	}
	/*
	//Check for odd numbers
	if(ideal_width & 1)
	  ideal_width++;
	if(ideal_height & 1)
	  ideal_height++;
	*/

	display_set_gui_size(ideal_width,ideal_height);

	GUIWIDTH=display_get_gui_width()
	GUIHEIGHT=display_get_gui_height()




}
