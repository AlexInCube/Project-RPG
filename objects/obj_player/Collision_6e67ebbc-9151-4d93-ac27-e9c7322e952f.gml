
var xp
with (other) {
	xp=expr
	instance_destroy()
}

with (obj_player_stats){
	expr+=xp
	if expr>maxexpr{
		level +=1
		expr = expr-maxexpr
		maxexpr *=2
		skillpoints +=1
	}
}

