
var xp
with (other) {
	xp=expr
	instance_destroy()
}

with (obj_player_stats){
	expr+=xp
	if expr>max_expr{
		level +=1
		expr = expr-max_expr
		max_expr *=2
		skillpoints +=1
	}
}

