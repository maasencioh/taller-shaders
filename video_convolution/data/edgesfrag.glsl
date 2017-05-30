#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;
uniform vec2 texOffset;
uniform float[25] convMatrix;

varying vec4 vertColor;
varying vec4 vertTexCoord;

const vec4 lumcoeff = vec4(0.299, 0.587, 0.114, 0);

void main() {
  vec2 tc00 = vertTexCoord.st + vec2(-2*texOffset.s, -2*texOffset.t);
  vec2 tc01 = vertTexCoord.st + vec2(  -texOffset.s, -2*texOffset.t);
  vec2 tc02 = vertTexCoord.st + vec2(           0.0, -2*texOffset.t);
  vec2 tc03 = vertTexCoord.st + vec2(  +texOffset.s, -2*texOffset.t);
  vec2 tc04 = vertTexCoord.st + vec2(+2*texOffset.s, -2*texOffset.t);
  vec2 tc05 = vertTexCoord.st + vec2(-2*texOffset.s,   -texOffset.t);
  vec2 tc06 = vertTexCoord.st + vec2(  -texOffset.s,   -texOffset.t);
  vec2 tc07 = vertTexCoord.st + vec2(           0.0,   -texOffset.t);
  vec2 tc08 = vertTexCoord.st + vec2(  +texOffset.s,   -texOffset.t);
  vec2 tc09 = vertTexCoord.st + vec2(+2*texOffset.s,   -texOffset.t);
  vec2 tc10 = vertTexCoord.st + vec2(-2*texOffset.s,            0.0);
  vec2 tc11 = vertTexCoord.st + vec2(  -texOffset.s,            0.0);
  vec2 tc12 = vertTexCoord.st + vec2(           0.0,            0.0);
  vec2 tc13 = vertTexCoord.st + vec2(  +texOffset.s,            0.0);
  vec2 tc14 = vertTexCoord.st + vec2(+2*texOffset.s,            0.0);
  vec2 tc15 = vertTexCoord.st + vec2(-2*texOffset.s,   +texOffset.t);
  vec2 tc16 = vertTexCoord.st + vec2(  -texOffset.s,   +texOffset.t);
  vec2 tc17 = vertTexCoord.st + vec2(           0.0,   +texOffset.t);
  vec2 tc18 = vertTexCoord.st + vec2(  +texOffset.s,   +texOffset.t);
  vec2 tc19 = vertTexCoord.st + vec2(+2*texOffset.s,   +texOffset.t);
  vec2 tc20 = vertTexCoord.st + vec2(-2*texOffset.s, +2*texOffset.t);
  vec2 tc21 = vertTexCoord.st + vec2(  -texOffset.s, +2*texOffset.t);
  vec2 tc22 = vertTexCoord.st + vec2(           0.0, +2*texOffset.t);
  vec2 tc23 = vertTexCoord.st + vec2(  +texOffset.s, +2*texOffset.t);
  vec2 tc24 = vertTexCoord.st + vec2(+2*texOffset.s, +2*texOffset.t);

  vec4 col00 = texture2D(texture, tc00);
  vec4 col01 = texture2D(texture, tc01);
  vec4 col02 = texture2D(texture, tc02);
  vec4 col03 = texture2D(texture, tc03);
  vec4 col04 = texture2D(texture, tc04);
  vec4 col05 = texture2D(texture, tc05);
  vec4 col06 = texture2D(texture, tc06);
  vec4 col07 = texture2D(texture, tc07);
  vec4 col08 = texture2D(texture, tc08);
  vec4 col09 = texture2D(texture, tc09);
  vec4 col10 = texture2D(texture, tc10);
  vec4 col11 = texture2D(texture, tc11);
  vec4 col12 = texture2D(texture, tc12);
  vec4 col13 = texture2D(texture, tc13);
  vec4 col14 = texture2D(texture, tc14);
  vec4 col15 = texture2D(texture, tc15);
  vec4 col16 = texture2D(texture, tc16);
  vec4 col17 = texture2D(texture, tc17);
  vec4 col18 = texture2D(texture, tc18);
  vec4 col19 = texture2D(texture, tc19);
  vec4 col20 = texture2D(texture, tc20);
  vec4 col21 = texture2D(texture, tc21);
  vec4 col22 = texture2D(texture, tc22);
  vec4 col23 = texture2D(texture, tc23);
  vec4 col24 = texture2D(texture, tc24);

  vec4 sum = convMatrix[0]*col00 +  convMatrix[1]*col01 +  convMatrix[2]*col02 +  convMatrix[3]*col03 +  convMatrix[4]*col04
          +  convMatrix[5]*col05 +  convMatrix[6]*col06 +  convMatrix[7]*col07 +  convMatrix[8]*col08 +  convMatrix[9]*col09
          + convMatrix[10]*col10 + convMatrix[11]*col11 + convMatrix[12]*col12 + convMatrix[13]*col13 + convMatrix[14]*col14
          + convMatrix[15]*col15 + convMatrix[16]*col16 + convMatrix[17]*col17 + convMatrix[18]*col18 + convMatrix[19]*col19
          + convMatrix[20]*col20 + convMatrix[21]*col21 + convMatrix[22]*col22 + convMatrix[23]*col23 + convMatrix[24]*col24;
  gl_FragColor = vec4(sum.rgb, 1.0) * vertColor;
}
