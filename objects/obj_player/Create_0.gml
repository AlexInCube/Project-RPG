spd=2
hspd=0
vspd=0
dir=0



findradius=16

image_speed=0.4


sprite[RIGHT,MOVE] = spr_player_right
sprite[UP,MOVE] = spr_player_up
sprite[DOWN,MOVE] = spr_player_down
sprite[UPRIGHT,MOVE] = spr_player_upright
sprite[DOWNRIGHT,MOVE] = spr_player_downright

state=scr_move_state;

spd = 2;

//--------Dialogue Stuff
reset_dialogue_defaults();
myPortrait			= spr_portrait;
myVoice				= snd_voice2;
myFont				= fnt_small;
myName				= scr_find_keyword("player_name")

