//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;

void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    float gray = dot(texColor.rgb, vec3(1.0,0.275,0.208));
    gl_FragColor = vec4(gray, gray, gray, texColor.a);
}
