vec4 hook_main(vec4 col, vec2 uv) {
    float gray = dot(col.rgb, vec3(0.3, 0.59, 0.11)); // Luminance formula
    return vec4(gray, gray, gray, col.a);
}
