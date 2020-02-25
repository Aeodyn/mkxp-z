
uniform sampler2D v_texture;

in vec2 v_texCoord;

out vec4 fragColor;
void main() { fragColor = texture(v_texture, v_texCoord); }
