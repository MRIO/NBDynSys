# 1D Discrete (cont.)

### Stability of Fixed Points

(Ref. [AY], Theorem 1.5, [AY] Sect. 1.3 , [HK] Sect. 3.4)

Hyperbolic **fixed points** come in flavors, the most common of which are stable (which attract orbits), and unstable (which repel). The stability is given by the slope $f'$of the map $f$ at the fixed point $x^*$. That is,

- stable: $f'(x^*)<1$ 
- unstable: $f'(x^*)>1$ 

The proof of this fact is simple. Imagine that we have a slope of the derivative (call it '$a$') at the fixed point ('$p$') whose modulus is smaller than 1. Now, taking the definition of a derivative and simply stating that the derivative is smaller than a:

$lim_{x \rightarrow p} \frac{|f(x) - f(p)|}{|x-p|} = |f'(p)| < a$

It should be evident that for any $x$ very close to $p$ (say, $\epsilon$ ):

$\frac{|f(x) - f(p)|}{|x-p|} < a$

meaning that $x$ is closer to $p$ than $f(x)$ is to $f℗$:

And the more we iterate the function ($k$ times), the closer they become, exponentially:

$|f^k(x) - f^k(p)| < a^k |x-p|$

Things look similar to the proof for unstable fixed point (repelling). 

Attracting and repelling fixed points with $|f'(x^*)| \not = 1 $ are called hyperbolic (because states close to the fixed point separate or approach according to a hyperbola).

And how about fixed points which are neither attracting nor repelling? There, we see a...

### Bifurcation

A **bifurcation** is a **qualitative change in the behavior** of the orbits of a map or function as a parameter changes. Bifurcations occurs when (1) fixed points change stability (from attracting to repelling, for example), or when (2) further equilibria emerge (for 1D maps this happens when a deformation of the function defining the map leads the function to cross the identity line). 

It is often the case that when that when new equilibria appear, we observe the emergence of ...

### Periodic orbits

([AY], Sec. 1.4, 1.5, Definition 1.8)

Periodic orbits often emerge when fixed-points appear in the higher order compound maps $f^k$, that is, when $|f^k(x^*)|=x^*$ for $k>1$.

### Stability of periodic orbits

Incidentally, the **stability of periodic orbits** can also be tested with the method of calculating the derivative of the compound map, $f^{k}{}' (x) = x$ — where k, is the number of iterations of the map. The same rule for stability of fixed points applies.

to note:

- Fixed points of the iterated map may or may not be part of periodic orbits.

### Bifurcation Diagram

(refs. [AY] , [H.K] 3.3 Bifurcations of monotone maps  (Cases I, II and III) 3.3HK)

To discover the possible orbits under deformations of the logistic map by parameterizing it, we introduced the **bifurcation diagram**, which is a method of displaying the long term behavior of orbits. For a given parameterized function $f$, the bifurcation diagram is constructed by:

1. selecting a parameter within a range of parameters, the so called **parameter space** (one possible parameter space for the logistic map could be, for example 0..4)
2. computing an orbit for a certain number of iterations (N)
3. pruning the **transient** of the orbit (ditching the first K iterations)
4. plotting the remaining orbit states as a function of the parameter



In the logistic map, as the parameter a is increased, the higher iterates start producing more and more intersections with the identity line. For instance, when $a=3$, two things happen: (1) the stable fixed point loses stability ($f'(x^*)>1$), and (2) in the second iterate of the map, two other intersections appear, both with slopes smaller than 1, meaning these two equilibria of the second iterate constitute a stable (periodic) attractor. When $a$ grows, these intersections of the higher iterates appear in pairs (can you see why?), leading to a **period doubling cascade**. 

### Chaos

(refs. [AY] Sect. 3.1 and 3.5, [HK])

For certain parameterizations, orbits are very complex, and clearly **aperiodic**. These orbits display **sensitivity to initial conditions**, that is, initial conditions that may start infinitesimally close to each other (in matlab, **eps**), soon diverge wildly. One measure of divergence of orbits is given by the ...

### Lyapunov Exponent

[refs. [AY] Sect. 3.1 See also [AY] 6.1]

The **Lyapunov exponent**, which **calculates the exponential separation **of orbits (ref: Alligood, 3.1). The assignment for this week is to calculate the Lyapunov exponent for values of a between [0..4], by calculating the local divergence of the points of the orbit.  **Chaos** is often observed when the Lyapunov exponent is positive.

### Topological conjugacy

(refs. [AY] sec. 3.3 and definition 3.10, exercise 3.7)

When two maps $F$ and $G$ are topologically conjugate, that is, when there's a smooth transformation $C$ that takes all the points in one map to points in the other map, the qualitative dynamics of one tell tales about the behavior of the other. This crucial fact is one of the cornerstones of the study of dynamical sytems, as it guarantees that many theorems have general applicability.



## References and Further Reading for This Week

[AY] Chaos - Aligood and Yorke ( Chap. 1 and 3)

[HK] Dynamics and Bifurcations - Hale and Koçak

[1] The Birth of period 3, Saha and Strogatz.

[2] Periodic orbits (Chap.4 by Robert Gillmore) (Sect. 4.1 - 4.5, and 4.7.2)

[3] Sarkovski Theorem,  [pdf] The Logistic Map, Period-Doubling To Chaos

