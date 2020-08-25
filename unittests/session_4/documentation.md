# Programming concepts

No new programming concepts will be introduced. However, keep in mind that `arrayfun` and `meshgrid` are assumed as prior knowledge from now on. You will have to use these features again, so if you aren't fully confident in your knowledge, read up on these functions in the documentations or the notes from last week.

# Exercise: The Julia set and the Mandelbrot set

In this exercise, we will plot the Julia set and the Mandelbrot set as explained in the lecture. To do this, we will re-use a large fraction of the code previously written. You are handed a folder that contains two empty functions, `juliaset.m` and `mandelbrot.m`. Please copy the functions `nd_orbit.m`, `nd_orbit_after_transients.m` and `average_orbit_step.m` from previous week into the same folder. You will first be asked to make a slight change to one of these files. Afterwards you will fill in `juliaset.m` and `mandelbrot.m`.

## 1. Adapting `nd_orbit_after_transients.m`
If you have done the previous exercise correctly, you defined the Hénon map in this file. Now change this expression to be the quadratic map $q_c(x): \mathbb{C} \rightarrow \mathbb{C} = x^2 + c$. Do this as an anonymous function.
## 2. Writing `juliaset.m`
The Julia set contains all elements $x_i \in \mathbb{C}$ for which the map $q$ starting at $x_i$ does not diverge. To solve this problem easily, try a similar approach as you did last week in `average_orbit_step_on_grid.m`. However, instead of iterating over $x$ and $y$ in your grid, let these two grids denote $\mathcal{R}\left\lbrace x \right\rbrace$ and $\mathcal{I}\left\lbrace x \right\rbrace$ respectively. Take $c = -0.4 + 0.6i$. Try different values of $c$ and appreciate the mathematical beauty on display.
## 3. Writing `mandelbrot.m`
For this problem, instead of exploring the phase space like we did in the previous exercise, we explore the parameter space. By simply changing the order in the `average_order_step` function, this can be easily implemented. Keep in mind that $c$ is a complex value. Plot this output as a black-and-white map. Try varying the ranges and resolutions. Are you able to find an interval for which the output is self-similar to the larger set?


