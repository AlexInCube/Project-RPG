spd=2
hspd=0
vspd=0
len=0
dir=0
xaxis=0
yaxis=0


findradius=16

image_speed=0

face=RIGHT
sprite[RIGHT,MOVE] = spr_player_right
sprite[UP,MOVE] = spr_player_up
sprite[LEFT,MOVE] = spr_player_left
sprite[DOWN,MOVE] = spr_player_down

state=scr_move_state;

spd = 2;

//--------Dialogue Stuff
reset_dialogue_defaults();
myPortrait			= spr_portrait;
myVoice				= snd_voice2;
myFont				= fnt_small;
myName				= scr_find_keyword("player_name")

