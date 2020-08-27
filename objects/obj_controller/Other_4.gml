//Dont save room data
room_persistent=false
depth=1
//But save player data
if instance_exists(obj_player){
obj_player.persistent=true
}


instance_create_layer(0,0,"Instances",obj_camera)


