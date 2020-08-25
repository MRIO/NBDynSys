# Week 3


## Mandelbrot Fractals and 2D Maps 
##Essential review from Week 2 — i.e. 1D Maps*

# Notation fundamentals:

in 1D maps, fixed points come in two breeds, Sinks (also called stable fixed points, attractors) andSources (unstable fixed points, repellers). See more about stability of fixed points, 1.3AY , 3.4HK) Check that you understand the diference between hyperbolic and non hyperbolic fixed points. Hyperbolic fixed points determine that the flow either contracts or expands. Non hyperbolic fixedpoints are often accompanied of changes of the dynamics, i.e., bifurcations often co-occur withnon hyperbolic fixed points (e.g. Flip Bifurcation or Period Doubling Bifurcation HK 3.4)

## TODOs of Last Week:

- Find out about shadow orbits of the logistic map. Which parameter ranges are shadow orbits observed? (hint: shadow orbits are usually chaotic orbits)
- Compute shadow orbits of the logistic map in parameter ranges where shadow orbits are observed (e.g matlab). That is, keep the a parameter fixed (thus maintaining the dynamical systemunchanged) and calculate two orbits that start with very similar initial conditions, for example .7
  and .7+eps, where eps is an infinitesimal. Then:

- Calculate the exponential separation of orbits (Lyapunov exponent , 6.1AY.
- Extra challengecompute the Lyapunov exponent for the logistic map in the 0<a<4 parameter range (see figure6.3AY to check for your solution, or to skip the challenge altogether)

Certify yourself that you grok the following statements:

- It is possible to tell whether a map will have periodic orbits by inspecting the number of fixed points of the iterates of the map. Make sure this statement is sensible: section 1.6
- It is possible to tell whether the periodic orbits of a map are stable or unstable by calculating the derivatives at the fixed points of the iterated maps: section 1.6

### Today’s topics

After reconsidering the order of presentation of today’s topics, it becomes apparent that I should have sticked withthe more natural sequence for the study of 2D maps, as I have originally laid out. First we learn about linear maps, and the behavior of orbits close to fixed points. Second we learn about how to use linear maps in understanding **non linear maps ** (like the Henon map for example), through linearization at the fixed points of the system, via a Jacobian Matrix.

Linear maps : deepen your understanding about the behavior of orbits of linear systems, where the only fixed point is at the origin (section 2.3 of AY).

The qualitative behavior of orbits close to the fixed points are fully determined as a function of theeigenvectors and eigenvalues of the linear system (section AY 2.3).

https://app.classeur.io/#!/files/KGwkBpb7d4Ks7fMoFINt

Eigenvectors and eigenvalues - to remind yourself of the effect of using a matrix to transform avector, use the function eigshow in matlab. To examine your own matrix, call it in the command linewith eigshow(A) — where A is your matrix defined as Z = [ a b ; c d ] where a,b,c,d are specifiednumbers.

Eigenvalues determine whether the orbits contract or expand. In 2D maps we find three kinds offixed points, attractors (or sinks), repellers (or sources) and saddle nodes (which attract in certaindirections and contract in others)

Cases to note:
Distinct Real Eigenvalues (AY Example 2.5)
Repeated Eigenvalue (AY Example 2.6)
Complex Eigenvalues (AY Example 2.7)

NOTE: a simple coordinate transform (translation) may transform any point in the dynamics as the origin.The dynamics around the new origin is preserved (AY section 2.4)

Linearizing a map is an essential tool to analyze non linear maps. A large class of non linear maps areamenable to study via calculating the Jacobian Matrix at the fixed points (AY section 2.5)

## The 3 Body Problem

The analysis of the 3 body problem by Poincaré led to many seminal discoveries and developments in thetheory of dynamical systems. Read more about it at section 2.1, page 41-52.

The Mandelbrot set

The Mandelbrot set is an example of an iterated map in 2D. It displays fractal basin boundaries (section AY4.4), similar to those of the Henon Attractor. That is, the perimeter shows self-similar detail in multiplescales. Further reading: AY 4.5 Fractal Dimension and AY page 167.

TO DOs:

Extend the programming concepts learned from the logistic map in 1D and make a matlab function thatreturns a 2D orbit

This function should return both an orbit of the Henon Map on the x y plane and the orbit of the twovariables as a function of the number of iterations (x axis represents sequences of states).

Calculate the fixed points of example 2.3 AY
Reproduce (qualitatively) figure 2.9, with the mathematica demonstration:

http://demonstrations.wolfram.com/PlayingWithTheHenonMapStartingWithACircleOrASquare/

DISCOVER:

Background to understand how maps are obtained from differential equations

https://app.classeur.io/#!/files/KGwkBpb7d4Ks7fMoFINt Page 2 of 3

Classeur – The app 29/09/16 08:48

To know more:

https://www.youtube.com/watch?v=zXTpASSd9xE&index=11&list=PL7G5UnDx-bEaFO2b3FS0q33bRm0jH8cAp

Fun point to inspect is in the description Mandelbub, a mandelbrot in 3D
Great Information about the Mandlebrot set is available in the Numberphile channel in Youtube