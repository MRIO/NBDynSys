# Project Description

## Neural Networks
1. **Echo-state Networks and Reservoir Computing**
   1. Explain how Recurrent Neural Networks are coupled dynamical systems
   2. Visualize a high dimensional attractor of an RNN via a First Return Map
   3. Demonstrate that (given certain conditions) a RNN is a dynamical repository for memories
   4. Train a Recurrent Neural Network to produce a desired attractor
2. **Criticality and Cascades** 
   1. Discuss the phenomenon of up-down states in the cerebral cortex
   2. Explain what is a critical cascade in a (neural or not) network 
   3. Discuss the equilibrium parameter


## Topology

3. **Homoclinic and Heteroclinic Orbits**
   1. Explain and find examples of natural systems with both **homoclinic and heteroclinic** orbits. 
   2. List and elucidate the bifurcations in 2D that exemplify the transition between the two.
   3. When moving to 3D, in the case of homoclinic orbits, the **topology** of the orbits has to be considered. Explain what a **Möbius strip** is. What is the difference between an  **oriented and twisted** homoclinic orbit?
   4. CHALLENGE: Try to find a bifurcation in 3D that transitions from an oriented to a twisted homoclinic orbit? Do these even exist? 


   ## Orbits, Bifurcations and Chaos

4. **Lorenz Attractor**

   1. Describe the original (physical) model from which the **Lorentz Attractor** emerges clearly explaining what are its state variables and parameters.
   2. List the features of the Lorentz Attractor
   3. Find the equilibria and describe the bifurcations that they undergo
   4. Show the parameter regions where the Lorentz Attractor is chaotic
   4. What kinds of things can happen in 3D that cannot happen in 2D?

5. **Blue-sky catastrophe**

   1. Explain what is the **co-dimension of a bifurcation**?
   2. Introduce us to the **Blue-sky Catastrophe** and the Bogdanov-Takens bifurcation. What are the similarities between the two?
   3. What is an orbit with infinite period?


6. **Chaos in the Laboratory**

   1. Give (many!) examples of **Chaos was observed in the Laboratory**
   2. Show how the Poincaré map can help determining the presence of Chaos 
   3. Refs:
      1.  Lab Visit 3 in Alligood, Sauer, Yorke -- Chaos 
      2. Nonlinear Systems and Chaos -- Strogatz

7. **Period 3 implies chaos**

   1. Explain in your own words why period 3 implies Chaos  (Challenge 1, Chapter one in Alligood)
   2. Introduce us to Sharkovski numbering and the sequence of periodic attractors

8. Why is the **Feigenbaum Tree Universal**? 
   1. Introduce us to renormalization theory
   2. (See: Non-linear dynamics and Chaos - Strogatz)

## Bifurcations in Biology


9. **Predator Prey Dynamics and Bifurcations**

   1. Walk us through the dynamics and bifurcations of the **predator prey** continuous system.
   2.  This model does not take space into account — find a modified version of it that includes space (diffusion/ particle models). What changes?
   3. What happens when you take different numbers of species?

10. **Bifurcations of the Hodgkin Huxley** Neuronal Model?

   1. Describe the bifurcations of the Hodgkin Huxley model
   2. Introduce co-dimension 2 bifurcations
   3. Simulate some of the bifurcations and show solutions for different parameter values

11. **Bistability in Glycolisis**

   1. Read the paper "Bacterial sugar utilization gives rise to distinct single-cell behaviors" by Afroz, Biliouris, Kaznessis and Beisel.

   - Elaborate on the experimental setup used
   - Explain what **hysteresis** is and give examples of dynamical systems in which it appears
   - Try to come up with a biological reason why hysteresis is useful/evolutionarily **advantageous** in the case of sugar utilization
   - Implement the model in the paper and solve it using your preferred solver
   - CHALLENGE: Study a linearization of the system around the monostability/bistability threshold

12. **Stochastic dynamical systems in population biology**

   1. Explain the Wright-Fisher model of gene transfer

   - Explain how it generalizes to **WF-diffusion** in the continuous limit
   - What dynamical systems' analysis tools can you use for this model?
   - How does this model explain **gene fixation**?
   - CHALLENGE: Study an extension of the Wright-Fisher model, such as WF-with-mutation or a WF variant adding spatial information or cross-generational breeding (Moran model)

13. **Bistability in Bacterial Evolution**
	
	1. Implement and discuss the model in "J. Barrett Deris et al., The innate growth bistability and fitness landscapes of antibiotic resistant bacteria. Science. 2013 November 29; 342(6162): 1237435. doi:10.1126/science.1237435.1."
	
	2. Explain the emergence of the cusp catastrophe in this system
	
	3. Relate this to a Wright-Fisher model
	
	   

## Fractals

14. **Cantor Sets**

   1. Define the Cantor set with its properties
   2. Calculate the Hausdorff dimension for the Cantor Set
   3. Show a 1D map that produces a Cantor Set
   4. Give examples of how other attractors (Julia set, Henon set,…) have the properties of Cantor sets

15. **Create a stochastic fractal **
   1. Expain what is an L-system fractal
   2. Explain what is a stochastic fractal
   3. Use Context Free (app). 
   4. Estimate the fractal dimension of a fractal you create via box-counting

16. **Brownian Surfaces**
   1. Describe a Brownian surface and algorithms that produce it
   2. Showcase code that produces a Brownian "Mountain Range" or "Islands" 
   3. Discuss the fractal dimension of surfaces
   4. ![image-20190928162632494](../../../../Library/Application Support/typora-user-images/image-20190928162632494.png)
17. **Fractals from Diffusion Limited Aggregation**
   1. Explain an implementation of Diffusion Limited Aggregation
   2. Discuss uses and aspects of DLA (Mountain ranges / Alveoli / Circulatory System / Corals)
   3. Discuss the fractal dimension for both 2D and 3D fractals
   4. ![image-20190928162858615](../../../../Library/Application Support/typora-user-images/image-20190928162858615.png)

## Synchrony and Coupling

18. **Kuramoto Synchrony and Waves**
   1. Explain the topology of trajectories of a pair of oscillators (ref. Geometry of Biological Time, Winfree)
   2. What changes when oscillators are placed in 2D?  Illustrate the consequence of different connectivity patterns between the coupled oscillators.
   3. Plot the  bifurcation diagram for coupling for the different systems

19. **Synchronous Chaos**
   1. Explain what are coupled dynamical systems
   3. Give examples of applications of Synchronous chaos
	 2. Exemplify methods to synchronize Chaotic Attractors
   3. How can Synchronous chaos be used for cryptography?

## Cellular automata

20. **Implement Conway's Game of Life** 
   1. Implement two rule variations to the Game of Life
   2. Describe the results in terms of stability of forms
   3. Identify a number of cyclic entities with different periods (e.g., gliders)
   4. Two possible paths for discussion:
      1. Draw connections about the stability of living organisms (from the article "Autopoiesis and the Game of Life" by Randal Beer)
      2. Discuss the stability of forms in a 3D version of the GoL.

21. **Investigate elementary cellular automata**
   1. Define the elementary cellular automaton and how to read a Wolfram code
   2. Describe the different Wolfram types of behavior for cellular automata
   3. What's so special about class 4 automata and Rule 110
   4. Reading the grid as binary, some rules result in generating functions. Elaborate on this.