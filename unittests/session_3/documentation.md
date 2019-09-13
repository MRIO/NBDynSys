# Programming concepts

## Functional Programming in MATLAB 2: Mapping Boogaloo
Functional programming, as introduced a week earlier, is a new way to look at MATLAB scripts that trades off slightly more unreadable and obfuscated code for a major advantage; it namely directly ports to a parallelization on the GPU, which allows you to run code much faster. We previously introduced you to the `arrayfun` function as an example of a higher-order function. Higher-order functions are different from regular functions since they do not just take data (in MATLAB nearly always in the form of an array), but can also take functions as their input. What the `arrayfun` function does is apply the function passed to it on all elements of a passed array, such as in
```matlab
arrayfun(@cos, [0, pi/2, pi, 3*pi/2]);
>> ans = [1 0 -1 0]
```
### Cell array-based mapping and cellfun
As shown, the `arrayfun` function works on a container. But this container doesn't necessarily have to be an array. An identical higher-order function has been defined for cell arrays, namely `cellfun` (not to be confused with the portable digital communication device in your pocket, that is namely a cellphone).
The function is near-identical to the previously introduced `arrayfun`. It applies a function that takes a function `f` and a cell array `c`, and returns a vector `v`, of which `v(i) = f(c{i})`. This can be useful if your function takes arbitrary-length input. Another use is a slight workaround, based on the fact that MATLAB has no simple way of applying a function column-wise unless directly built in, like in the `sum` function. To do this, we use the `num2cell` function on a matrix to transform it into a cell array, of which the `i`th element is equal to the `i`th column of the matrix. Subsequently, we use `cellfun` to apply the function to each cell array. 

## Meshgrids
When exploring a state space, you often wish to vary multiple dimensions. This can be done using two loops. However, knowing MATLAB is not optimized for looping, but instead for vectorized operations, a second method is far easier. This is called a meshgrid. Calling a meshgrid via
```matlab
[x, y] = meshgrid(xs, ys);
```
results in two matrices containing the x and y coordinates of a grid. The size of the grid, as well as the distance between two adjacent grid points, is passed into this function using the parametes `xs` and `ys` in the standard `begin:step:end` format.


