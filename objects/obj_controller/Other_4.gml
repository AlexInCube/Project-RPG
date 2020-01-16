/// @description Insert description here
// You can write your code in this editor


view_enabled=true;
view_visible[0]=true;


camera_set_view_size(view_camera[0],960/2,540/2);
//surface_resize(application_surface, 960, 540);


//camera_set_view_size(view_camera[0],global.width/2,global.height/2);
//surface_resize(application_surface, global.width, global.height);
//display_set_gui_size(global.width, global.height)


window_set_size(global.width,global.height)



depth=1

if instance_exists(obj_player){
obj_player.persistent=true
}




