///@description scr_change_gui_size
///@arg guisize
var display_height=global.height,display_width=global.width
var ideal_width=0;
var ideal_height=719;

switch(argument0){
	case 0: global.guisize=0;ideal_height=global.height break;
	case 1: global.guisize=1;display_height=720;display_width=1280 break;
	case 2: global.guisize=2;display_width=global.width/2;display_height=global.height/2 break;
}



var aspect_ratio=display_width/display_height;

ideal_width=round(ideal_height*aspect_ratio);
//ideal_height=round(ideal_width / aspect_ratio);

//Perfect Pixel Scaling
if(display_width mod ideal_width != 0)
{
  var d = round(display_width/ideal_width);
  ideal_width=display_width/d;
}
if(display_height mod ideal_height != 0)
{
  var d = round(display_height/ideal_height);
  ideal_height=display_height/d;
}

//Check for odd numbers
if(ideal_width & 1)
  ideal_width++;
if(ideal_height & 1)
  ideal_height++;


display_set_gui_size(ideal_width,ideal_height);

GUIWIDTH=display_get_gui_width()
GUIHEIGHT=display_get_gui_height()

