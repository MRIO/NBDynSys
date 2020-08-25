# Week 5 - 1D flows and bifurcations

### Flows in one dimension

A **flow** $\psi(x_0,t)$ **is a collection of trajectories** that are the solutions to the **initial value problem** $\dot{x}=f(x)$ for some function $f(x)$ and $x(0)=x_0$, where $x_0$ is some initial condition at $t=0$.  

The direction of the flow under dynamics defined by a 1D curve (a 1D ‘**manifold**’), is given simply by the sign of the function at a point. Evidently, **states** flow to the right if the function is positive at that point, and to the left, if negative. **Fixed points $\bar{x}$ of flows are found where the rate function  is equal to zero, i.e., $\dot{x}=f(\bar{x}) = 0$ **.

#### Stability of Equilibria

As in the 1D discrete map, we can visually **determine the stability of the fixed point** by looking **at the slope  of the function in the immediate vicinity** of the fixed point, i.e., the **derivative**. Is the slope of the function positive? If so, initial states to the left of the fixed point approach it from the left and similarly, initial states to the right, decrease in value, orienting the flow towards the fixed-point through both directions, and thus resolving a **stable —attracting— fixed point**. Conversely, negative slope creates an **unstable —repelling—  fixed point**. What happens when the slope is zero because the derivative is degenerating? In that case, we need to look at the fate of orbits very close to the fixed point. For instance, we may have a fixed-point equilibrium that attracts orbits to the left while repelling orbits to the right: **a saddle-node**. When $f'(\bar{x})=0$, we call the fixed point **'non-hyperbolic'**, and there, funky things may happen, viz-a-viz...

![fixed_point_stability_1D_flows](fixed_point_stability_1D_flows.png)

### Bifurcations: Parameterizing Dynamical Systems

The focus today was on the structure of bifurcations, that is, the ways in which equilibria appear and disappear as parameters are changed.

**Bifurcations occur when fixed points change in character** (from an attractor to a repellor, for instance), altering locally the directions of the flow. It is easy to see how this can happen when the function representing the dynamical system is **parameterized**, such that the slope of the intersections of the function change at that fixed point, for instance, by adding a constant value 'c' to the parabola, $\dot{x} = f(x) = x^2+c$.



![parameterizing_a_parabola](parameterizing_a_parabola.png)

Bifurcations fall into a finite number of categories, the so called **‘canonical forms’** of bifurcations, representing particular kinds of fixed point alterations, which can fit many scenarios and functions. Along with flipping signs (so called ,**'flip bifurcations'**, for example when $d$ above changes sign ), fixed points may appear where there wasn’t one (parameters get the curve to intersect), or they may join and then disappear together (e.g., pitchfork bifurcations), or simply change in character (e.g., 'transcritica bifurcation').

Importantly, the function governing the dynamics may change during a process — that is, the **parameter** may change as the system is moving to the future. In these cases, we speak of **a ‘parameterized’ dynamical system**. The state $x$ continues to exist, but it is now subject to a function that continuously changes $f_c(x)$, so $x$ is subject to different dynamical systems over time. It’s also conceivable that the parameter **fluctuates** around a fixed values, in which case we speak of a **‘perturbation’**. Perturbations in dynamical systems often lead to symmetry breaking, a  phenomenon that underlies a vast class of morphogenetical patterns, such as in **catastrophe theory** (we'll see more about that).

## TODO's:

- Grasp the **Uniqueness and Existence Theorem** for flows [HK] 1.1.
- Review the **implicit function theorem**.
- Make sure you are able to **draw bifurcation diagrams** for all the canonical bifucations ( [HK] Chap. 2.1, Examples 2.1 - 2.5). In fact, answer the question: what are 'canonical bifurcations'? Can you think about examples of physical systems that sport such bifurcations?
- **[HK] Example 2.6:** Can you **sketch the dynamical systems** that emerge when we parameterize the cubic function $f(x)=c+dx-x^3$? Notice that now there are two parameters. In class we have studied the bifurcations through each parameter independently. What happens when the **parameter space is a 2D** space? 
  - Follow the derivation of the cusp for the function  — codimension 2 bifurcation for the cubic.
- Algebra exercises:
  - Plot and derive some example flows for 1D systems  [HK] Exercises 1.5 (pg. 16) and 1.8, pg. 1.9;
  - Answer the question [HK] 1.10
- Make sure you grasp the logics of the **Hysteresis loop**. Else, **pose questions**, e.g., on the forum!
- What does the **'Implicit Function Theorem'** state?
- Can you **come up with an algorithm** that allows you to plot bifurcation diagrams? 


### Next Lectures

- Homeomorphisms, diffeomorphisms and topological conjugacy in flows
- cyclic functions
- 2D functions and bifurcation of vector fields
- Excitability and more!

