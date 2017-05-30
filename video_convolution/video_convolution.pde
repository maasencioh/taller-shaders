import processing.video.*;
Movie myMovie;
PImage still;
PShader edgesShader;

int current = 0;
int convolutions = 4;

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
  println(frameRate);
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
        0, 0, 0,
        0, 8, 0,
        0, 0, 0
      };
      return identity;
    case 1:
      float[] sharpen = {
         0, -1, 0,
        -1,  5, -1,
         0, -1,  0
      };
      return sharpen;
    case 2:
      float[] edge = {
        -1, -1, -1,
        -1,  8, -1,
        -1, -1, -1
      };
      return edge;
    case 3:
      float const9 = 1.0/9.0;
      float[] blur = {
        const9, const9, const9,
        const9, const9, const9,
        const9, const9, const9
      };
      return blur;
    default :
      return new float[9];
  }
}