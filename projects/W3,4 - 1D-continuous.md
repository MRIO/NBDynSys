**Week 3,4 - 1D continuous dynamical systems**

In the last lecture we continued to look into the long term behavior of 1D dynamical systems, but we made a transition between** maps**, which resolve discrete time dynamical systems, to ODE’s, which represent continuous time differential equations, called **flows**. 

f’(x0) = 0; so that f(x0) = x0;

The direction of the flow under dynamics defined by a 1D curve (a 1D ‘**manifold**’), is given simply by the sign of the function at a point, states flow to the right if the function is positive at that point, and to the left, if negative. **Fixed points of flows are found where the rate function is equal to zero**.

The direction of a 1D flow is determined simply by the sign of the function at that point (trivially: if function has a positive value, the state moves to the right and vice-versa).

As in the 1D case, we can visually **determine the stability of the fixed point** by looking **at the immediate vicinity** of the fixed point. Regard the function at the fixed point: is the slope of the function positive? If so, values close to the fixed point tend to increase, i.e., the dynamics takes the state away from the fixed point. Conversely, if the slope of the function is negative, then states close to the fixed point decrease in value.  Alternatively, we can calculate the modulus of the derivative at the fixed point. 

 

**Bifurcations occur when fixed points change in character** (from an attractor to a repellor, for instance), altering locally the directions of the flow. It is easy to see how this can happen when the function representing the dynamical system is parameterized, such that the shape of the function changes at that spot.

Imagine for instance that our function on the left is parameterized with a constant that can take positive or negative values. The function flips vertically when the value of the parameter changes sign. This is the same as flipping the slope, which signifies that a attractor becomes a repellor and vice versa.

Bifurcations fall into a finite number of categories, the so called** ‘canonical forms’ of bifurcations**, representing particular kinds of fixed point alterations. Along with flipping signs (**flip bifurcations)** as above, fixed points may appear where there wasn’t one (parameters get the curve to intersect), or they may join and then disappear.

Importantly, the function governing the dynamics may change during a process — that is, the parameter may change as the system is moving to the future. In these cases, we speak of **a ‘parameterized’ dynamical system**. It’s also conceivable that the parameter fluctuates around a fixed values, in which case we speak of a **‘perturbation’.**

Here are two examples of bifurcations in discrete systems **(maps)**:

 

 

Let’s train our eye to recognize bifurcations by doing the following exercise. Consider the flow defined by the function below. Can you sketch the kinds of bifurcations available to this system as parameters change?

 

We’ve also discussed **topological conjugacy**, the property of qualitatively similar flows.