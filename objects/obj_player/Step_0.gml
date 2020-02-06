show_debug_message(instance_exists(obj_controller))

script_execute(state)
if (obj_player_stats.hp <= 0) {
instance_destroy()
}

depth = -y