
uniform mat4 projMat;

uniform vec2 texSizeInv;
uniform vec2 translation;

uniform highp int aniIndex;

attribute vec2 position;
attribute vec2 texCoord;

varying vec2 v_texCoord;

const int nAutotiles = 7;
const float tileW = 32.0;
const float tileH = 32.0;
const float autotileW = 3.0*tileW;
const float autotileH = 4.0*tileW;
const float atAreaW = autotileW;
const float atAreaH = autotileH*nAutotiles;
const float atAniOffsetX = 3.0*tileW;
const float atAniOffsetY = tileH;

uniform lowp int atFrames[nAutotiles];

void main()
{
	vec2 tex = texCoord;
	lowp uint atIndex = int(tex.y / 128.0);

	lowp float pred = float(tex.x <= atAreaW && tex.y <= atAreaH);
	lowp uint frame = aniIndex % atFrames[atIndex];
	lowp uint col = frame % 8;
	lowp uint row = frame / 8;
	tex.x += col * atAniOffsetX * pred;
	tex.y += row * atAniOffsetY * pred;

	gl_Position = projMat * vec4(position + translation, 0, 1);

	v_texCoord = tex * texSizeInv;
}
