spd=2//Default speed
hspd=0//Horizontal speed
vspd=0//Vertical Speed
dir=0//Move direction
mouse_dr=0//Mouse dir for weapon draw
len=0//for dash
findradius=16//For item collecting
stats = obj_player_stats.stats
Die = method_get_index(obj_player_stats.Die)

image_speed=0.4

//Control sprite
sprite[LEFT,MOVE] = spr_player_left
sprite[RIGHT,MOVE] = spr_player_right
sprite[UP,MOVE] = spr_player_up
sprite[DOWN,MOVE] = spr_player_down
//Player state for execution
state=move_state;

//--------Dialogue Stuff
reset_dialogue_defaults();
myPortrait			= spr_portrait;
myVoice				= snd_voice2;
myFont				= fnt_small;
myName				= find_keyword("player_name")
