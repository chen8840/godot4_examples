shader_type canvas_item;

void fragment() {
	// 用蓝色表示其他物体
	COLOR.rgb = vec3(0.,0.,1.);
	if (texture(TEXTURE,UV).a > 0.0) {
		COLOR.a = 0.5;
	} else {
		COLOR.a = 0.0;
	}
}
