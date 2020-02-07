room_persistent=false
depth=1

if instance_exists(obj_player){
obj_player.persistent=true
}

view_enabled=true;
view_visible[0]=true;

var display_height=270,display_width=480
var aspect_ratio=display_width/display_height
var ideal_height=270

var ideal_width=round(ideal_height*aspect_ratio);
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

camera_set_view_size(view_camera[0],ideal_width,ideal_height)



