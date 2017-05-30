import processing.video.*;
Movie myMovie;
PImage still;
PShader edgesShader;

int current = 0;
int convolutions = 9;

int w = 1200;
int h = 700;

void setup() {
  size(1200, 700, P2D);
  edgesShader = loadShader("edgesfrag.glsl");
  myMovie = new Movie(this, "funny_compilation.mp4");
  myMovie.loop();
  still = createImage(w, h, RGB);
}

void draw() {
  edgesShader.set("convMatrix", changeConv(current));
  shader(edgesShader);
  if (myMovie.available()) {
    myMovie.read();
  }
  still = myMovie.get();
  image(still, 0, 0);
}

void keyPressed() {
  if (key == ' ') {
    current = (current + 1) % convolutions;
  }
}

float[] changeConv(int current) {
  switch(current) {
    case 0:
      float[] identity = {
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 1, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0
      };
      return identity;
    case 1:
      float[] sharpen = {
        0,  0,  0,  0, 0,
        0,  0, -1,  0, 0,
        0, -1,  5, -1, 0,
        0,  0, -1,  0, 0,
        0,  0,  0,  0, 0
      };
      return sharpen;
    case 2:
      float[] edge0 = {
        0,  0, 0,  0, 0,
        0,  1, 0, -1, 0,
        0,  0, 0,  0, 0,
        0, -1, 0,  1, 0,
        0,  0, 0,  0, 0
      };
      return edge0;
    case 3:
      float[] edge1 = {
        0, 0,  0, 0, 0,
        0, 0,  1, 0, 0,
        0, 1, -4, 1, 0,
        0, 0,  1, 0, 0,
        0, 0,  0, 0, 0
      };
      return edge1;
    case 4:
      float[] edge2 = {
        0,  0,  0,  0, 0,
        0, -1, -1, -1, 0,
        0, -1,  8, -1, 0,
        0, -1, -1, -1, 0,
        0,  0,  0,  0, 0
      };
      return edge2;
    case 5:
      float[] edge3 = {
        0, 0,  0, 0, 0,
        0, 1,  1, 1, 0,
        0, 1, -7, 1, 0,
        0, 1,  1, 1, 0,
        0, 0,  0, 0, 0
      };
      return edge3;
    case 6:
      float[] blur0 = {
        0,     0,     0,     0, 0,
        0, 1/9.0, 1/9.0, 1/9.0, 0,
        0, 1/9.0, 1/9.0, 1/9.0, 0,
        0, 1/9.0, 1/9.0, 1/9.0, 0,
        0,     0,     0,     0, 0
      };
      return blur0;
    case 7:
      float[] blur1 = {
        1/256.0,  4/256.0,  6/256.0,  4/256.0, 1/256.0,
        4/256.0, 16/256.0, 24/256.0, 16/256.0, 4/256.0,
        6/256.0, 24/256.0, 32/256.0, 24/256.0, 6/256.0,
        4/256.0, 16/256.0, 24/256.0, 16/256.0, 4/256.0,
        1/256.0,  4/256.0,  6/256.0,  4/256.0, 1/256.0
      };
      return blur1;
    case 8:
      float[] unsharp = {
        -1/256.0,  -4/256.0,  -6/256.0,  -4/256.0, -1/256.0,
        -4/256.0, -16/256.0, -24/256.0, -16/256.0, -4/256.0,
        -6/256.0, -24/256.0, 476/256.0, -24/256.0, -6/256.0,
        -4/256.0, -16/256.0, -24/256.0, -16/256.0, -4/256.0,
        -1/256.0,  -4/256.0,  -6/256.0,  -4/256.0, -1/256.0
      };
      return unsharp;
    default :
      return new float[25];
  }
}