# Fractal Flame

To begin this chapter, please read through the chapter on [Iterated Function Systems](../IFS/IFS.md) where we discuss methods through which fractals and fractal-like patterns can be generated with an assortment of functions known as the Hutchinson operator:

$$
H(P) = \bigcup_{i=1}^Nf_i(P).
$$

Here, $$P$$ represents a point in some coordinate system, and $$\bigcup_{i=1}^Nf_i(P)$$ signifies a union of $$N$$ functions ($$f_i(P)$$) that act on that point to create new, unique patterns.
The classical example is the Sierpinski triangle, where the Hutchinson operator encompasses three distinct functions:

$$
\begin{align}
f_1(P) &= \frac{P + A}{2}\\
f_2(P) &= \frac{P + B}{2}\\
f_3(P) &= \frac{P + C}{2}\\
\end{align}
$$

Here, $$A$$, $$B$$, and $$C$$ are three arbitrarily chosen points on a two-dimensional plane ($$\mathcal{R}^2$$).
There are many ways to iterate through this function system, but the most common method is with a "chaos game."
This process works by choosing a random point on the plane and and then randomly selecting any function it every iteration.
This will chaotically produce the an image of a triangle of triangles shown below:

ADD IMAGE

This is the Sierpinsky triangle and might be one of the most famous fractals currently known.
To make sure we are all on the same page, the code to generate this triangle can be seen here:

ADD CODE

The idea of a chaos game will be used throughout this chapter to recreate similar fractal-like structures; however, the functions have much, much more variation than those shown for the Sierpinski triangle.
In addition, several other concepts (like [convolutions](../signal_processing/signal_processing.md)) are used to make sure the resulting image is visually ... .
To start, let's discuss the breadth of available functions and use them in the chaos game before.
After that, we will discuss several image manipulation strategies make the resulting images really *pop*!

## Possible variations

In the fractal flame method, each function is known as a *variation* and there are at least 48 outlined in the original paper {{ "draves2003fractal" | cite }}.
For the purposes of this chapter, we will not be covering all 48, but will instead cover a subset that allows for the greatest understanding of all possible variations allowed by this method.

## Image processing

## Example Code

{% method %}
{% sample lang="jl" %}
[import, lang:"julia"](code/julia/IFS.jl)
{% endmethod %}

### Bibliography

{% references %} {% endreferences %}

<script>
MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
</script>

## License

##### Code Examples

The code examples are licensed under the MIT license (found in [LICENSE.md](https://github.com/algorithm-archivists/algorithm-archive/blob/master/LICENSE.md)).

##### Text

The text of this chapter was written by [James Schloss](https://github.com/leios) and is licensed under the [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/legalcode).

[<p><img  class="center" src="../cc/CC-BY-SA_icon.svg" /></p>](https://creativecommons.org/licenses/by-sa/4.0/)

#### Images/Graphics

- The image "[IFS triangle 1](res/IFS_triangle_1.png)" was created by [James Schloss](https://github.com/leios) and is licensed under the [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/legalcode).
