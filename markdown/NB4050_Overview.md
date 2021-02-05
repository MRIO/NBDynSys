# Dynamical Systems and Computational Modeling Walkthrough

## Books

[AY] - Aligood and Yorke, **Chaos**

[M] - Mandelbrot, **The Fractal Geometry of Nature**

[HK] - Hale and Koçak, **Dynamics and Bifurcations**

[ST] - Strogatz, **Nonlinear Dynamics and Chaos**

[Win] - Winfree, **Geometry of Biologica Time**

## Week 1: 1D Maps
### Concepts

Systems (dynamical, complex, adaptive), dynamical system's terminology (state, phase space, orbits, attractors, parameters), iterated functions and 1D maps, logistic map, cobweb plot.

###  Programming

	- in class: compute orbits for arbitrary maps by passing anonymous functions
	- in class: display the cobweb plot

### Learning Goals (be able to...)

- Apply basic terminology of dynamical systems (see concepts above)
- Find equilibria in 1D maps.
- Compute orbits for arbitrary 1D dynamical systems.
- Use a cobweb plot to determine the future states of an 1D iterated system.
- Identify dynamical system's equilibria and their stability.
- Reason about the influence of parameters on the dynamics of the logistic map.
- [Programming] Pass anonymous functions (lambda functions).as arguments
- Use anonymous functions in matlab to compute orbits 

### Sources
	[AY]  1.1, 1.2, 1.3, 1,4



## Week 2: 1D Maps (Part II)

### Concepts

Fixed point theorem, stability of fixed points, periodic attractors, stability of periodic attractors, bifurcation diagram, period doubling cascade, period doubling route to chaos, chaos, topological conjugacy, lyapunov exponents.

### Programming

```
- in class: Compute bifurcation diagrams
- in class: Compute the Lyapunov exponents of orbits of the logistic map.
```

### Code Concepts
	Data collection: cells or arrays?
	Apply anonymous functions to cells and arrays

### Learning Goals
- Analyze the long term behavior of a parameterized dynamical system.
- Explain the emergence of period doubling in 1D maps.
- Understand the relationship between periodic attractors and iterated maps and analyze stability of periodic orbits.
- Enumerate the hallmark properties of a chaotic attractor.
- Calculate an approximation to the Lyapunov exponent.
- Grasp the concept of topological equivalence.

### Sources
	[AY] 1.5, 1.6, 1.7, 1.8
	[AY] 3.1, 3.2, 3.3. 3.5
	[AY] 4.4
	[AY] 11.1, 11.4



## Week 3: 2D maps and ND maps

### Sources
	[AY] Entire chapter 2
	[AY] 5.4, 5.6

### Content
Fixed points in 2D, linear systems, stability analysis, stable and unstable manifolds, coupled systems (predator-prey), non linear 2D maps, basins of attraction, periodicity, stretch and fold, fractal basin boundaries, discrete time RNNs, spectral radius.

### Programming
	in class: Plot attractors of 2D discrete systems
	in class: Animate code that shows how attractors of Hénon map change with parameterizations.
	in class: Plot the basin boundaries of the Hénon attractor

### Code Concepts
	Using imagesc() and pcolor() to indicate basins and escape velocity.
	Using figure handles (avoiding hold on).
	Create and save animations.

### Learning Goals
- Compute the evolution of state variables in a 2D discrete map.
- State the fixed point theorem in 2D in the context of stretching and folding.
- Grasp the concept of a manifold, including stable and unstable manifolds.
- Calculate the stability of fixed points in 2D maps.
- Discover computationally the basins of attraction of different attractors (in the Hénon map).
- Visualize a period doubling bifurcation in 2D maps.
- Understand how stretch and fold in phase space may lead to chaotic orbits.


## Week 4: Fractals

### Sources
	[AY] Entire chapter 4
	[M] Chapters 1-3
### Content
Complexity, properties of the cantor set, fractals, fractal dimension, box counting dimension, divergence speed, Mandelbrot set, Julia set.
### Programming
	Compute and display the Mandelbrot set
	Select a point of the mandelbrot set from which to compute the Julia set

### Code Concepts
	Passing arrays as parameters for anonymous functions in arrayfun and bsxfun
	Select data from plot

### Learning Goals
 - Be able to distinguish countable from uncountable sets.
 - Enumerate and describe the mathematical properties of a Cantor Set.
 - Describe how the coast of England is like a fractal.
 - Estimate and compute the Mandelbrot set and the Julia set.
 - Be able to describe the relatioship between the Mandelbrot and the Julia set.
 - Relate the main axis of the Mandelbrot set with a bifurcation diagram.

## Week 5: Bifurcations of 1D flows

### Sources
	[HK] Chapter 1 and 2
	[ST] Chapter 2 and 3
### Concepts
Flows, stability of fixed points, basins of attraction, asymptotic and non-asymptotic attraction,  impossibility of oscillations, 1D bifurcations, canonical bifurcations, cusp catastrophe, hysteresis, potential function.

### Exercises
- Calculate potential functions
- Find fixed points and calculate stability

### Learning Goals
- Develop intuition about the directions of flows.
- Reason about linear and non-linear composition of functions.
- Understand the conditions for existence and uniqueness of solutions for 1D systems.
- Describe the conditions for appearance of the following bifurcations: saddle node, pitchfork, transcritical.
- Describe how the cusp catastrophe emerges in 1D systems under 2 parameters.
- Describe the hysteresis phenomenon via the cusp catastrophe in systems with co-existing equilibria.
- Produce an arbitrary function that displays hysteresis.
- Know what kinds of bifurcations are associated with a hysteresis loop.
- Explain the emergence of hysteresis in systems with coexisting equilibria.

## Week 6: 2D Flows and Bifurcations of Vector Fields

### Sources
	[AY] 8.1, 8.2
	[ST] 5.0, 5.1, 5.2
	[ST] 6.0 through 6.3
	[ST] 8.1, 8.2
	[HK] 8.1 through 8.4

### Concepts
Bifurcations of linear systems, circular phase spaces, limit cycles, Van der Pols oscillator, Fitzhug-Nagumo model, Bifurcations of the Fitzhugh-Nagumo model, Bifurcations of 2D maps, Poincaré-Bendixon theorem.

#### Programming

	Plot vector fields.
	Find nulclines symbolically.
	Approximate the Jacobian at Equilibria.

#### Code Concepts
	Symbolic computation
	Implement sliders for parameter space exploration
### Learning Goals
- Categorize flows close to equilibria as a consequene of jacobian normal forms.
- Discover the directions of a 2D flow using nulclines.
- Determine which flows are topologically equivalent.
- Understand the emergence of local bifurcations as a function of the transition between different categories of flows.
- Differentiate local from global bifurcations.


## Week 7:  Networks (Coupled oscillators)
### Sources
	[ST] 4.0, 4.1, 4.2, 4.3, 4.5
	[WIN] 1A, 2A, 2B, 4A, 4B, 8A, 8B, 9A
### Concepts
Coupled dynamical systems, phase, phase coupling, toroidal phase spaces, coupled oscillators, phase response curves, synchrony (kuramoto parameter), phase transitions: criticality, wave propagation, topology ~= topography, reaction-diffusion, parameter space analysis, catastrophe theory and morphogenesis

### Programming
	in class: Simulator for coupled oscillators with euler forward solver
	at home: Find condition for synchrony

### Learning goals:
- Describe the conditons for emergence of a Hopf bifurcation in a 2D system.
- Understand when complex processes can be modeled via lower dimensional systems.
- Describe the process of emergence of oscillations and waves in systems of coupled oscillators.
- Distinguish different kinds of oscillatory processes such as fireflies and clocks.
- Name the crucial parameters underlying synchrony in a set of coupled oscillators.
- Gain insight into propagation of stimulus in excitable media.
- Describe and identify a phase singularity.

## Week 8: Quiz + Supervised Project Work


## Week 9: Project Presentations

### Project presentations

## Week 10: Project Presentations

### Project presentations
