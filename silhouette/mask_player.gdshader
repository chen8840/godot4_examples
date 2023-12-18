shader_type canvas_item;

void fragment() {
	// 用红色表示角色
	COLOR.rgb = vec3(1.,0.,1.);
	if (texture(TEXTURE,UV).a > 0.0) {
		COLOR.a = 0.5;
	} else {
		COLOR.a = 0.0;
	}
}
