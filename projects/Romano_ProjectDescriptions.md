# Project Description

## Orbits and bifurcations
1.  Explain and find examples of **homoclinic and heteroclinic** orbits. 
	* List bifurcations in 2D that exemplify the transition between the two.
	* Find a real system that displays it.
	* When moving to 3D, in the case of homoclinic orbits, the **topology** of the orbits has to be considered. Explain what a **Möbius strip** is. What is the difference between an  **oriented and twisted** homoclinic orbit?
	* CHALLENGE: Try to find a bifurcation in 3D that transitions from an oriented to a twisted homoclinic orbit? Do these even exist? 
2.  Explain the **origin and features** of the **Lorenz  Attractor.** 
	* How does the Lorenz attractor correlate with **atmospheric convection**
	* Implement a piece of code that plots the Lorenz system
	* Is there **self-similarity** present in the Lorenz system? If so, where can it be seen? If not, why?
	* What kinds of (topological) things can happen in 3D that cannot happen in 2D?
3.  Introduce us to the **Blue-sky Catastrophe** and the **Bogdanov-Takens bifurcation**. 
	* Explain what is the **co-dimension of a bifurcation**?
	* What are the conditions for a blue-sky catastrophe?
	* What are the similarities between the blue-sky catastrophe and the Bogdanov-Takens bifurcation?
4.  Find real models exemplifying each of the **co-dimension 1 bifurcations** in 1 dimensional systems ([http://www.scholarpedia.org/article/Bifurcation](http://www.scholarpedia.org/article/Bifurcation)).
	* Define the difference between these classes
	* Implement an example of each of these bifurcations
	* CHALLENGE: Use previously written tools like PyDSTool (https://pypi.org/project/PyDSTool/) to identify the **presence and class** of bifurcations of an arbitrary dynamical system.

## Fractals
5.  Introduce **Cantor sets**
	* Define the Cantor set with its properties.
	* Calculate the Hausdorff dimension for the Cantor Set.
	* Show a 1D map that produces a Cantor Set
	* Give examples of how other attractors (Julia set, Henon set,…) have properties of Cantor sets.
6. **Create an L-system fractal**
	* Explain the role of [recursion](#recursionmeme) in the construction of fractals.  
	* Explain what are **L-systems** (L stands for Lindemeyer)
	* Come up with an **interesting fractal** to show us. Compute the fractal dimension!
	* Explain how to extend the **L System** to compute stochastic fractals.
	* CHALLENGE: Estimate the **Fractal dimension** of your own design
8.  WARNING, QUITE MATHEMATICAL. CHOOSE AT YOUR OWN RISK. Study the **Weierstrass function** and its corresponding fractal
	* Explain the Weierstrass function and its definition
	* The Weierstrass function is often considered one of the most important discoveries in the field of mathematical analysis, shattering a **paradigm** of its time. Which paradigm is that? Why does this function go against **human intuition** this badly?
	* Implement the Weierstrass function in the language of your choice. Play around a bit with the **parameters**. What roles do they play? Show an animation for varying $b$.
	* Elaborate on the **self-similarity** of the Weierstrass function. Preferably show a nice zooming animation. How does this correlate with the previously shown surprising property of the function. 
	* What is the **Haussdorf dimension** of the Weierstrass function? Please, for your own sanity, try not to read the paper "Hausdorff dimension of the graphs of the classical Weierstrass functions" by Weixiao Shen 2018, unless you really want to.
## Oscillations
8.  Regard the parameters for **bifurcation on synchrony** for the Kuramoto model
	* What changes when the oscillators are laid out in a 2D sheet (with neighborhoods)?
	* Plot the **bifurcation diagram** for coupling (use the Kuramoto parameter -- Choose one value of the coupling and plot the bifurcation diagram for the spread (std) of intrinsic frequencies).
## Chaos
10.  Explain the phenomenon of **synchronization of chaotic attractors** and give one example.
11.  Explain in your own words **why period 3 implies chaos** (Challenge 1, Chapter one in Alligood)
12.  Why is the **Feigenbaum Tree Universal**? (See: Non-linear dynamics and Chaos - Strogatz)
13.  Explain how **Chaos was observed in the Laboratory** via the Poincaré map (Lab Visit 3 in Alligood, Sauer, Yorke -- Chaos)

## Biological dynamical systems
14.  Investigate the **Predator-Prey** map
	 * Implement the Lotka-Volterra model
	 * Identify all bifurcations in this system. What is the **biological meaning** of this?
	 * Find a modified version that contains **spatial information**. How does it incorporate spatial separation between individuals of species?
	 * How does this change the behavior of the system? 
15.  What are all the Bifurcations of the Hodgkin-Huxley Neuronal Model?
	 * Elaborate on the physics in the Hodgkin-Huxley model
	 * Identify all **bifurcations** in this model
	 * What do the different states represent **with respect to neuroscience**?
16. Read the paper "Bacterial sugar utilization gives rise to distinct single-cell behaviors" by Afroz, Biliouris, Kaznessis and Beisel.
	* Elaborate on the experimental setup used
	* Explain what **hysteresis** is and give examples of dynamical systems in which it appears
	* Try to come up with a biological reason why hysteresis is useful/evolutionarily **advantageous** in the case of sugar utilization
	* Implement the model in the paper and solve it using your preferred solver
	* CHALLENGE: Study a linearization of the system around the monostability/bistability threshold
17. Reaction-diffusion systems underlie Turing patterns in biological tissues
	 * Elaborate on **reaction-diffusion equations** in 2D
	 * Explain how these systems return a number of different classes of shapes
	 * Read the paper "Diverse set of Turing nanopatterns coat corneae across insect lineages" by Blagodatski *et. al.*
	 * Elaborate on figure 3I in this paper and explain this figure in terms of bifurcations. What **kind of bifurcation** is this? Why are there white regions in this figure?
	 * CHALLENGE: Implement an **RD-equation solver** and obtain all three classes of solutions
18. Wright-Fisher diffusion and stochastic dynamical systems in population biology
	* Explain what the Wright-Fisher model of gene transfer is like
	* Explain how it generalizes to **WF-diffusion** in the continuous limit
	* How does this model explain **gene fixation**?
	* CHALLENGE: Study an extension of the Wright-Fisher model, such as WF-with-mutation or a WF variant adding spatial information or cross-generational breeding
## Cellular automata
19.  Implement **Conway's Game of Life** 
        * Implement two rule variations to the Game of Life
        * Describe the results in terms of **stability** of forms
        * Identify a number of **cyclic entities** with different periods
        * CHALLENGE: Make connections with the article "Autopoiesis and the Game of Life" by Randal Beer
21.  Investigate elementary cellular automata
        * Define the elementary cellular automaton and how to read a **Wolfram code**
        * Describe the different **Wolfram types** of behavior for cellular automata
        * What's so special about **class 4** automata and **Rule 110**
        * Reading the grid as binary, some rules result in **generating functions**. Elaborate on this.

