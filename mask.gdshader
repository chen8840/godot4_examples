shader_type canvas_item;

uniform vec3 outline_color = vec3(1.0,0.0,0.0);

void fragment() {
	vec4 tex_color = texture(TEXTURE , UV);
	if (tex_color.r > 0.49) {
		// 显示主角
		COLOR= vec4(0.0);
	} else if (tex_color.b > 0.7) {
		// 显示重叠
		COLOR = tex_color;
		COLOR.rgb = outline_color.rgb;

		// We convert the pixel width we want for our outline in decimal texel size.
		vec2 size = vec2(1.0) / vec2(textureSize(TEXTURE, 0));

		// We sample and offset the texture 8 times to draw an outline.
		float alpha = 1.0;
		alpha += (texture(TEXTURE, UV + vec2(0.0, -size.y)).b > 0.7 ? 1.0 : 0.0);
		alpha += (texture(TEXTURE, UV + vec2(size.x, -size.y)).b > 0.7 ? 1.0 : 0.0);
		alpha += (texture(TEXTURE, UV + vec2(size.x, 0.0)).b > 0.7 ? 1.0 : 0.0);
		alpha += (texture(TEXTURE, UV + vec2(size.x, size.y)).b > 0.7 ? 1.0 : 0.0);
		alpha += (texture(TEXTURE, UV + vec2(0.0, size.y)).b > 0.7 ? 1.0 : 0.0);
		alpha += (texture(TEXTURE, UV + vec2(-size.x, size.y)).b > 0.7 ? 1.0 : 0.0);
		alpha += (texture(TEXTURE, UV + vec2(-size.x, 0.0)).b > 0.7 ? 1.0 : 0.0);
		alpha += (texture(TEXTURE, UV + vec2(-size.x, -size.y)).b > 0.7 ? 1.0 : 0.0);

		// If the summed alpha is too high, it means we're over the original texture
		// and we don't want to draw this pixel; it's not part of the outline.
		if (alpha >= 9.0) {
			alpha = 0.0;
		}

		// We then override the texture's color with the calculated outline.
		COLOR = vec4(outline_color.rgb, min(alpha, 1.0) * tex_color.a);
	} else {
		COLOR= vec4(0.0);
	}
}
