# Week 5 - 1D flows and bifurcations

### Flows in one dimension

A **flow** $\psi(x_0,t)$ **is a collection of orbits** that are the solutions to the **initial value problem** $\dot{x}=f(x)$ for some function $f(x)$ and $x(0)=x_0$, where $x_0$ is some initial condition at $t=0$.  

The direction of the flow under dynamics defined by a 1D curve (a 1D ‘**manifold**’), is given simply by the sign of the function at a point. Evidently, **states** flow to the right if the function is positive at that point, and to the left, if negative. **Fixed points $\bar{x}$ of flows are found where the rate function  is equal to zero, i.e., $\dot{x}=f(x^*) = 0$ **.

It is important to note that oscillations cannot happen in such 1D flows. For proof and further intuitions check [1] section 2.6.2.

#### Stability of Equilibria

As in the 1D discrete map, we can visually **determine the stability of the fixed point** by looking **at the slope  of the function in the immediate vicinity** of the fixed point, i.e., the **derivative**. Is the slope of the function positive? If so, initial states to the left of the fixed point are moving away from itand similarly, initial states to the right, increase in value, orienting the flow away from the fixed-point through both directions, and thus resolving an **unstable —repelling— fixed point**. Conversely, negative slope creates an **stable —attracting—  fixed point**. What happens when the slope is zero because the derivative is degenerating? In that case, we need to look at the fate of orbits very close to the fixed point. For instance, we may have a fixed-point equilibrium that attracts orbits to the left while repelling orbits to the right: **a saddle-node**. When $f'(x^*)=0$, we call the fixed point **'non-hyperbolic'**, and there, funky things may happen, viz-a-viz, bifurcations.

### Bifurcations: Parameterizing Dynamical Systems

The focus today was on the structure of bifurcations, that is, the ways in which equilibria appear and disappear as parameters are changed.

**Bifurcations occur when fixed points change in character** (from an attractor to a repellor, for instance), altering locally the directions of the flow. It is easy to see how this can happen when the function representing the dynamical system is **parameterized**, such that the slope of the intersections of the function change at that fixed point, for instance, by adding a constant value 'c' to the parabola, $\dot{x} = f(x) = x^2+c$. 

Bifurcations fall into a finite number of categories, the so called **‘canonical forms’** or also **'normal forms'** of bifurcations, representing particular kinds of fixed point transitions, which can be made to fit many scenarios and functions by topological deformations of the original function. 

Things that can happen with a fixed point:

- Stable fixed point becomes a saddle then disappears ('flip bifurcation' or 'saddle node')
  - Normal form:
    $$f(x) = \dot{x} = x^2 +c$$
- Where there was one stable fixed point ($c>0$), now there are three ($c<0$), two stable surrounding one unstable ('pitchfork supercritical')
  - Normal form:
    $$f(x) = \dot{x} = cx-x^3$$;
- Where there was one unstable, now there are three, two unstable over one stable ('pitchfork subcritical')
  - Normal form:
    $$f(x) = \dot{x} = cx+x^3$$;
- Two fixed points (one stable one unstable) exchange their stability ('transcritical bifurcation')
  - Normal form:
    $$f(x) = \dot{x} = rx-x^2$$;


Importantly, the function governing the dynamics may change during a process — that is, the **parameter** may change as the system is moving to the future. In these cases, we speak of **a ‘parameterized’ dynamical system**. The state $x$ continues to exist, but it is now subject to a function that continuously changes $f_c(x)$, so $x$ is subject to different dynamical systems over time. It’s also conceivable that the parameter **fluctuates** around a fixed values, in which case we speak of a **‘perturbation’**. Perturbations in dynamical systems often lead to symmetry breaking, a  phenomenon that underlies a vast class of morphogenetical patterns, such as in **catastrophe theory**.

# Homework

[ST] 2.2.10, 2.3.1.a, 2.3.3 (tumor growth), 3.2.5 (Autocatalysis)

Learn about Hysteresis loops: [HK] Example 2.4 (pg. 30) or [ST] 3.6.

Review knowledge about integrators (e.g., writing your own simulator): [ST 2.8]. 

## Review

[ST] Strogatz - Non Linear Dynamics and Chaos

Sections 2.1 to 2.5 (Existence and Uniqueness), 3.1, 3.2, 3.4

[HK] Hale and Koçak - Dynamics and Bifurcations

Section 2.1 

### Further reading

Implicit function theorem: [HK] Section 2.2





