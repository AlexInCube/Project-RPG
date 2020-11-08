spd=2//Default speed
hspd=0//Horizontal speed
vspd=0//Vertical Speed
dir=0//Move direction
mouse_dr=0//Mouse dir for weapon draw

findradius=16//For item collecting


image_speed=0.4

//Control sprite
sprite[RIGHT,MOVE] = spr_player_right
sprite[UP,MOVE] = spr_player_up
sprite[DOWN,MOVE] = spr_player_down
sprite[UPRIGHT,MOVE] = spr_player_upright
sprite[DOWNRIGHT,MOVE] = spr_player_downright

//Player state for execution
state=move_state;

//--------Dialogue Stuff
reset_dialogue_defaults();
myPortrait			= spr_portrait;
myVoice				= snd_voice2;
myFont				= fnt_small;
myName				= find_keyword("player_name")