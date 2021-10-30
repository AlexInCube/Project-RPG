event_inherited()
phy_fixed_rotation=true

stats = new Entity_Stats()

max_hp=3
hp=max_hp

target = obj_player

create_buff_grid()

function Die(){console_log("die");instance_destroy()}