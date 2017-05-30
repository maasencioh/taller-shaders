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
### What are you representing?

* Sun fixed
* Earth orbiting around sun
* Moon orbiting around earth
* Venus orbiting around sun

V:

## Goal
### Motivation

How a planet or satellite moves?

* [Kepler's laws](https://en.wikipedia.org/wiki/Kepler%27s_laws_of_planetary_motion): how a planet moves
* [Vis-viva equation](https://en.wikipedia.org/wiki/Vis-viva_equation): properties of an oscillation movement

H:

## Implementation

* Scene-graph:
```
 World
  ^
  |\
  S Eye
  ^
  |\
  E V
  |
  M
```

* Default shader
* The spheres should follow the planetary mechanical physical laws

H:

## Demo

Describe the user interaction:

* Click: Toggles the mini-map
* Mouse movement: moves the mini-map view
* Mouse wheel: rotates the mini-map view

H:

## Conclusions

1. Difficulties splitting the references axis of different planets
2. Add rotation of axis
3. Add rotation speed (Kepler's second law)

H:

## Questions

?

H:

## References

* [Math primer for graphics and game development](https://tfetimes.com/wp-content/uploads/2015/04/F.Dunn-I.Parberry-3D-Math-Primer-for-Graphics-and-Game-Development.pdf)
* [Kepler's laws](https://en.wikipedia.org/wiki/Kepler%27s_laws_of_planetary_motion)
* [Vis-viva equation](https://en.wikipedia.org/wiki/Vis-viva_equation)
* [Perihelion and aphelion](https://en.wikipedia.org/wiki/Perihelion_and_aphelion)
* [Planetary orbits](https://en.wikipedia.org/wiki/Ellipse#Planetary_orbits)
* [Orbital eccentricities](https://en.wikipedia.org/wiki/Orbital_eccentricity#Examples)