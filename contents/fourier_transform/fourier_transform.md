## What is a Fourier Transform?

To an outsider, the Fourier Transform looks like a mathematical mess -- certainly a far cry from the heroic portal between two domains I have depicted it to be; however, like most things, it's not as bad as it initially appears to be.
So, here it is in all it's glory!

$$F(\xi) = \int_{-\infty} ^\infty f(x) e^{-2 \pi i x \xi} dx$$

and

$$f(x) = \int_{-\infty} ^\infty F(\xi) e^{2 \pi i \xi x} d\xi$$

Where $$F(\xi)$$ represents a function in frequency space, $$\xi$$ represents a value in frequency space, $$f(x)$$ represents a function in real space, and $$x$$ represents a value in the real space.
Note here that the only difference between the two exponential terms is a minus sign in the transformation to frequency space.
As I mentioned, this is not intuitive syntax, so please allow me to explain a bit.

Firstly, **what does the Fourier Transform do?**

If we take a sum sinusoidal functions (like $$\sin(\omega t)$$ or $$\cos(\omega t)$$), we might find a complicated mess of waves between $$\pm 1$$.
Each constituent wave can be described by only one value: $$\omega$$.
So, instead of representing these curves as seen above, we could instead describe them as peaks in frequency space, as shown below.

<div style="text-align:center">
<video width="600" height="800" autoplay controls loop>
  <source src="res/FT_plot.mp4" type="video/mp4">
Your browser does not support the video tag.
</video> 
</div>

This is what the Fourier Transform does!
After performing the transform, it is now much, much easier to understand precisely which frequencies are in our waveform, which is essential to most areas of signal processing.

Now, how does this relate to the transformations above?
Well, the easiest way is to substitute in the Euler's formula:

$$e^{2 \pi i \theta} = \cos(2 \pi \theta) + i \sin(2 \pi \theta)$$

This clearly turns our function in frequency space into:

$$F(\xi) = \int_{-\infty} ^\infty f(x) (\cos(-2 \pi x \xi) + i \sin(-2 \pi x \xi))dx$$

and our function in real space into:

$$f(x) = \int_{-\infty} ^\infty F(\xi) (\cos(2 \pi \xi x) + i \sin(2 \pi \xi x)) d\xi$$

Here, the $$\sin$$ and $$\cos$$ functions are clearly written in the formulas, so it looks much friendlier, right?
This means that a point in real space is defined by the integral over all space of it's corresponding frequency function multiplied by sinusoidal oscillations.

Truth be told, even after seeing this math, I still didn't understand Fourier Transforms.
Truth be told, I didn't understand it fully until I discretized real and frequency space to create the Discrete Fourier Transform (DFT), which is the only way to implement Fourier Transforms in code.

### What is a Discrete Fourier Transform?

In principle, the Discrete Fourier Transform (DFT) is simply the Fourier transform with summations instead of integrals:

$$X_k = \sum_{n=0}^{N-1} x_n \cdot e^{-2 \pi i k n / N}$$

and

$$x_n = \frac{1}{N} \sum_{k=0}^{N-1} X_k \cdot e^{2 \pi i k n / N}$$

Where $$X_n$$ and $$x_n$$ are sequences of $$N$$ numbers in frequency and real space, respectively.
In principle, this is no easier to understand than the previous case!
For some reason, though, putting code to this transformation really helped me figure out what was actually going on.

{% method %}
{% sample lang="jl" %}
[import:4-13, lang:"julia"](code/julia/fft.jl)
{% sample lang="c" %}
[import:8-19, lang:"c"](code/c/fft.c)
{% sample lang="clj" %}
[import:15-30, lang:"clojure"](code/clojure/fft.clj)
{% sample lang="cpp" %}
[import:23-33, lang:"cpp"](code/c++/fft.cpp)
{% sample lang="hs" %}
[import:7-13, lang:"haskell"](code/haskell/fft.hs)
{% sample lang="py" %}
[import:5-11, lang:"python"](code/python/fft.py)
{% sample lang="scratch" %}
[import:4-13, lang:"julia"](code/julia/fft.jl)
{% endmethod %}

In this function, we define `n` to be a set of integers from $$0 \rightarrow N-1$$ and arrange them to be a column.
We then set `k` to be the same thing, but in a row.
This means that when we multiply them together, we get a matrix, but not just any matrix!
This matrix is the heart to the transformation itself!

```
M = [1.0+0.0im  1.0+0.0im           1.0+0.0im          1.0+0.0im;
     1.0+0.0im  6.12323e-17-1.0im  -1.0-1.22465e-16im -1.83697e-16+1.0im;
     1.0+0.0im -1.0-1.22465e-16im   1.0+2.44929e-16im -1.0-3.67394e-16im;
     1.0+0.0im -1.83697e-16+1.0im  -1.0-3.67394e-16im  5.51091e-16-1.0im]
```

It was amazing to me when I saw the transform for what it truly was: an actual transformation matrix!
That said, the Discrete Fourier Transform is slow -- primarily because matrix multiplication is slow, and as mentioned before, slow code is not particularly useful.
So what was the trick that everyone used to go from a Discrete Fourier Transform to a *Fast* Fourier Transform?

Recursion!

<script>
MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
</script>

[This image was created by James Schloss](res/FT_plot.gif)
