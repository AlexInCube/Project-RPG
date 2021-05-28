/// @arg SM
/// @arg type
/// @arg *isHollow
/// @arg *xcenter
/// @arg *ycenter
function FG_light_SM_end() {

	var sm = argument[0], vb = vertex_create_buffer(),
		type = argument[1],
		hollow = 1;

	if argument_count>2
		hollow = argument[2]

	vertex_begin(vb, FG_light_vf)
	for(var i=1; i<array_length_1d(sm); i += 1 + (type == FG_ligt_SM.linelist)) {
		var pp = sm[i-1], cp = sm[i];
	
		vertex_position_3d(vb, pp[0], pp[1], pp[2])
		vertex_color(vb, $FF0000, 0)
		vertex_position_3d(vb, pp[0], pp[1], pp[3])
		vertex_color(vb, $FF0000, 0)
		vertex_position_3d(vb, cp[0], cp[1], cp[3])
		vertex_color(vb, $FF0000, 0)
	
		vertex_position_3d(vb, pp[0], pp[1], pp[2])
		vertex_color(vb, $FF0000, 0)
		vertex_position_3d(vb, cp[0], cp[1], cp[3])
		vertex_color(vb, $FF0000, 0)
		vertex_position_3d(vb, cp[0], cp[1], cp[2])
		vertex_color(vb, $FF0000, 0)
	
	
		vertex_position_3d(vb, pp[0], pp[1], pp[2])
		vertex_color(vb, $00FF00, 0)
		vertex_position_3d(vb, pp[0], pp[1], pp[3])
		vertex_color(vb, $00FF00, 0)
		vertex_position_3d(vb, cp[0], cp[1], cp[3])
		vertex_color(vb, $00FF00, 0)
	
		vertex_position_3d(vb, pp[0], pp[1], pp[2])
		vertex_color(vb, $00FF00, 0)
		vertex_position_3d(vb, cp[0], cp[1], cp[3])
		vertex_color(vb, $00FF00, 0)
		vertex_position_3d(vb, cp[0], cp[1], cp[2])
		vertex_color(vb, $00FF00, 0)
	
	
		vertex_position_3d(vb, pp[0], pp[1], pp[2])
		vertex_color(vb, $0000FF, 0)
		vertex_position_3d(vb, pp[0], pp[1], pp[3])
		vertex_color(vb, $0000FF, 0)
		vertex_position_3d(vb, cp[0], cp[1], cp[3])
		vertex_color(vb, $0000FF, 0)
	
		vertex_position_3d(vb, pp[0], pp[1], pp[2])
		vertex_color(vb, $0000FF, 0)
		vertex_position_3d(vb, cp[0], cp[1], cp[3])
		vertex_color(vb, $0000FF, 0)
		vertex_position_3d(vb, cp[0], cp[1], cp[2])
		vertex_color(vb, $0000FF, 0)
	
	
		vertex_position_3d(vb, pp[0], pp[1], pp[2])
		vertex_color(vb, $000000, 1)
		vertex_position_3d(vb, pp[0], pp[1], pp[3])
		vertex_color(vb, $000000, 1)
		vertex_position_3d(vb, cp[0], cp[1], cp[3])
		vertex_color(vb, $000000, 1)
	
		vertex_position_3d(vb, pp[0], pp[1], pp[2])
		vertex_color(vb, $000000, 1)
		vertex_position_3d(vb, cp[0], cp[1], cp[3])
		vertex_color(vb, $000000, 1)
		vertex_position_3d(vb, cp[0], cp[1], cp[2])
		vertex_color(vb, $000000, 1)
	}

	if !hollow {
		var xc = argument[3], yc = argument[4];
		for(var i=1; i<array_length_1d(sm); i += 1 + (type == FG_ligt_SM.linelist)) {
			var pp = sm[i-1], cp = sm[i];
		
			vertex_position_3d(vb, pp[0], pp[1], pp[3])
			vertex_color(vb, $FF0000, 0)
			vertex_position_3d(vb, cp[0], cp[1], cp[3])
			vertex_color(vb, $FF0000, 0)
			vertex_position_3d(vb, xc, yc, cp[3])
			vertex_color(vb, $FF0000, 0)
	
			vertex_position_3d(vb, pp[0], pp[1], pp[3])
			vertex_color(vb, $00FF00, 0)
			vertex_position_3d(vb, cp[0], cp[1], cp[3])
			vertex_color(vb, $00FF00, 0)
			vertex_position_3d(vb, xc, yc, cp[3])
			vertex_color(vb, $00FF00, 0)
		
			vertex_position_3d(vb, pp[0], pp[1], pp[3])
			vertex_color(vb, $0000FF, 0)
			vertex_position_3d(vb, cp[0], cp[1], cp[3])
			vertex_color(vb, $0000FF, 0)
			vertex_position_3d(vb, xc, yc, cp[3])
			vertex_color(vb, $0000FF, 0)
		
			vertex_position_3d(vb, pp[0], pp[1], pp[3])
			vertex_color(vb, $000000, 1)
			vertex_position_3d(vb, cp[0], cp[1], cp[3])
			vertex_color(vb, $000000, 1)
			vertex_position_3d(vb, xc, yc, cp[3])
			vertex_color(vb, $000000, 1)
		}
	}

	vertex_end(vb)
	vertex_freeze(vb)
	return vb


}
