<section id="themes">
	<h2>Themes</h2>
		<p>
			Set your presentation theme: <br>
			<!-- Hacks to swap themes after the page has loaded. Not flexible and only intended for the reveal.js demo deck. -->
                        <a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/black.css'); return false;">Black (default)</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/white.css'); return false;">White</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/league.css'); return false;">League</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/sky.css'); return false;">Sky</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/beige.css'); return false;">Beige</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/simple.css'); return false;">Simple</a> <br>
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/serif.css'); return false;">Serif</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/blood.css'); return false;">Blood</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/night.css'); return false;">Night</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/moon.css'); return false;">Moon</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/solarized.css'); return false;">Solarized</a>
		</p>
</section>

H:

# Shader's workshop
### Convolution over a video

Miguel Angel Asencio Hurtado

H:

## Index

 1. Goal<!-- .element: class="fragment" data-fragment-index="1"-->
 2. Implementation<!-- .element: class="fragment" data-fragment-index="2"-->
 3. Demo<!-- .element: class="fragment" data-fragment-index="3"-->
 4. Conclusions<!-- .element: class="fragment" data-fragment-index="4"-->
 5. Questions<!-- .element: class="fragment" data-fragment-index="5"-->

H:

## Goal

* Explore the use of shaders
* Support some common convolution kernels by default
* Filter video files

H:

## Implementation

It's defined a uniform variable with the size of the convolution kernel (5x5)
```glsl
uniform float[25] convMatrix;
```

All the vertex are defined
```glsl
    vec2 tc00 = vertTexCoord.st + vec2(-2*texOffset.s, -2*texOffset.t);
    vec4 col00 = texture2D(texture, tc00);
```

V:

## Implementation

The convolution kernel it's applied for every defined vertex
```glsl
vec4 sum = convMatrix[0]*col00 +  convMatrix[1]*col01 +  convMatrix[2]*col02 +  convMatrix[3]*col03 +  convMatrix[4]*col04
        +  convMatrix[5]*col05 +  convMatrix[6]*col06 +  convMatrix[7]*col07 +  convMatrix[8]*col08 +  convMatrix[9]*col09
        + convMatrix[10]*col10 + convMatrix[11]*col11 + convMatrix[12]*col12 + convMatrix[13]*col13 + convMatrix[14]*col14
        + convMatrix[15]*col15 + convMatrix[16]*col16 + convMatrix[17]*col17 + convMatrix[18]*col18 + convMatrix[19]*col19
        + convMatrix[20]*col20 + convMatrix[21]*col21 + convMatrix[22]*col22 + convMatrix[23]*col23 + convMatrix[24]*col24;
```

V:

## Implementation

In the code the uniform variable is setted

```processing
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
```

H:

## Demo
### Interaction

The shaders are passed using space

V:

## Demo
### List of kernels

0. Identity
1. Sharpen
2. Edge detection
3. Edge detection
4. Edge detection
5. Sharpen edges
6. Box blur
7. Gaussian blur 3×3
8. Gaussian blur 5×5
9. Unsharp masking 5×5

H:

## Conclusions

1. Difficulties debugging the GLSL code
2. Not all the filters works on the same kind of images
3. When the image have a constant color the kernels don't work well

H:

## Questions

?

H:

## References

* [Kernel list](https://en.wikipedia.org/wiki/Kernel_(image_processing))
* [Image Filtering](http://lodev.org/cgtutor/filtering.html)