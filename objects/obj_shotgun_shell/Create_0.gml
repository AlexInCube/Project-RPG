spin = random_range(-8, 8)
direction = (obj_player.mouse_dr*45)
image_alpha = 1
speed = random_range(10,14)
fadeRate = 0.002
td = 0 //Travel Distance
td_max = speed * 10//Travel Distance Max
state = "up"
audio_play_sound(snd_shotgun_shell_drop,1,false)