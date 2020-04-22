shader_type canvas_item;

uniform float opacity = 0.0;

void fragment(){
	vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV);
	
	float grey = (color.r+color.g+color.b) / 3.0; 
	color.rgb *= mix(color.rgb, vec3(grey, grey, 1), 1);
	
	COLOR = vec4(color.r, color.g, color.b, opacity);
}