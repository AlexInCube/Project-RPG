//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time; 
const float speed = 0.002;
const float Xfrequency = 10.0;
const float Xsize = 0.01;

void main()
{
	//Get pixel colors from texture
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	/*
	//Change contrast
	float constrast = 0.7;
	vec4 colour = texture2D(gm_BaseTexture,v_vTexcoord);
	gl_FragColor = vec4(colour.rgb * (1.0+constrast)/1.0, colour.a);
	*/
	//Coloring the texture
	gl_FragColor = vec4(gl_FragColor.r * 0.4 ,gl_FragColor.g * 0.3,gl_FragColor.b * 0.7, gl_FragColor.a * 0.8);
	
	//Distortion effect
	// horizontal wave            [     1 to -1      ]                            [ position     ]
	
	float Horizontal_Wave   = sin(time * speed + v_vTexcoord.y * Xfrequency) * (Xsize * v_vTexcoord.x) ;  
	
	
	vec4 distort = v_vColour * texture2D( gm_BaseTexture, vec2( v_vTexcoord.x + Horizontal_Wave , v_vTexcoord.y ) );
	
    gl_FragColor = distort;	
}
