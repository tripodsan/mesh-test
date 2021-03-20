shader_type canvas_item;

void fragment() {
  NORMAL = (COLOR.rgb * 2.0) - vec3(1, 1, 1);
  // NORMAL = normalize(UV.x < 0.5 ? vec3(-1,0,1) : vec3(1,0,1));
  COLOR = vec4(0.5, 0.5, 0.5, 1.0);
}
