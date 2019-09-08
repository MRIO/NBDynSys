# Cell arrays
Most of the optimizations present in MATLAB are based on the assumption that the data provided is in the form of a matrix and is therefore square or rectangular in shape. However, this is sometimes not sufficient. For this purpose, the clever folks at MathWorks introduced what is known as the Cell Array, often confusingly referred to as a `cell`. The `cell` is a **linear**, **random-access** data collection able to contain **arbitrary types**.
* Linear: Items are stored in order, such that it is sensible to talk about a first, second, third etc element. The cell array has a length.
* Random-access: You can access any element at any time by indexing. Unlike the way you index an array in MATLAB by using the round brackets `( )`, you use curly braces `{ }` for `cell`s.
* Arbitrary types: An array can only contain the same data types, such as *only* characters or *only* numbers. A cell array does not have that restriction. It is possible to create a `cell` that has a number as its first element, a character as its second element and even a vector or matrix as its third. Two vectors in a `cell` don't even have to have the same shape or dimensionality.
In order to declare an empty cell array, you can state
```matlab
my_cell = cell(3, 1); % This makes a cell array of shape 3x1
```
To add an element, you index via
```matlab
my_cell{1} = 1;
my_cell{2} = 'a';
my_cell{3} = [2 3 4];
```
and to get an element you can say
```matlab
my_integer = my_cell{1};
```
###  Disclaimer:
The cell array is often, if not always, significantly slower than natively using vectors. The reason for this is that the MATLAB interpreter has to do many different **checks** on the data. If for example you want to take the sum of all elements in a cell array, the interpreter has to check if the `+` operator is even defined for all the types in the cell. In order to optimize for speed, it is better to use arrays. If we instruct you to use a cell array, be assured that there is no faster way, or, if there is a faster way, we find that this way obfuscates the main idea of the exercise.

# Functional programming and arrayfun
The way you have learned to program is known as **imperative programming**. This means that your code consists of **data**, as well as different ways to tell the interpreter what to do with your data, namely **functions**. This is however not the only way to write code.
In your course Electronics and Instrumentation, and perhaps in other moments in your life, you have been exposed to **object-oriented programming**. This is a paradigm, started by Smalltalk in the 1980s, which decides to couple together data and functions into a single **object**. An object could for example represent a person, which has some data (age, name, gender etc), and some functions it could apply on its own data (changeName, ageUp). This paradigm therefore sees data and functions as linked.
A completely different paradigm, which has been present in academia since the 1950s, startng with LISP, is **functional programming**.  After a period of long obscurity, functional languages such as Scala and Wolfram's Mathematica are starting to become popular, and functional elements are added to languages such as Python, JavaScript and even MATLAB. A central tenet of functional programming is that the distiction between functions and data is fuzzy. This entails that data and functions can be used in a similar way, *i.e.* functions are **first-class citizens**. This has been shown in MATLAB in week 1 in the form of function handles. A function handle behaves similar to normal data, being able to be stored and passed. 
Functions can therefore be also be passed into other functions. Functions that take other functions as arguments are called **higher-order functions**, and are often useful in coding to express simple concept concisely. An example of a higher-order function that is often used is called a `map` function, in MATLAB called `arrayfun`. This is a function that is shorthand for the following code
```matlab
function out = arrayfun(input_function, array)
    out = array;
    for i=1:numel(array)
        out(i) = input_function(array(i))
    end
end
```
What this code does is apply a function `input_function` to all elements in a list, and returns the output. For example, using the `abs` function, we see that
```matlab
arrayfun(@abs, [-1 2 -3]) -> [1 2 3]
```
The function is passed as a function handle. The function can be a 
* Built-in, such as `abs` or `cos`
* Named function, defined in a separate file
* Anonymous function, such as `f = @(x) x^2 + x-2`

For the default `arrayfun`, the function has to fulfil a certain criterion. It has to have what's known as **uniform output**. For example, it should always output an integer, or a matrix that's exactly 3x3. This is done because in that case, MATLAB can construct a matrix from it. However, there are some cases where this just does not work. For example, take a function that can return either one or two outputs. In this case, instead of calling
```matlab
arrayfun(@my_function, my_container)
```
you call
```matlab
arrayfun(@my_function, my_container, 'UniformOutput', false)
```
and instead of an array, a cell array is returned, where the `i`th element is the function applied to the `i`th element of `my_container`. Here again the usefulness of the array list has been shown.

## Training exercise: The quadratic equation and arrayfun
Let $f(x) = x^2 + 3x + c$. Write a function that takes $c$ as input and returns the real roots (*i.e.* the values where $f(x)=0, x \in \mathbb{R}$) of this equation. Use the quadratic formula. Subsequently, use `arrayfun` to evaluate this function for the range $[-5, 5]$ taking steps of $\frac{1}{4}$. Use MATLAB to find the value for which $f(x)$ has a single real root.

# Main exercise: Bifurcation diagram and Lyapunov exponent
The main exercise for today involves drawing a bifurcation diagram for the logistic map. We will lead you through this problem in a number of steps.
## 1. Obtaining a fixed point set
The first function we will work on is called `fixedpoints`. This method will take a single parameter, called `a`, which is the parameter of the logistic map
$$x_{i+1} = ax(1-x_i), 0 \leq x_i \leq 1.$$
Use the previously written function `orbit` for a fixed number of iterations, and take a random value as the initial value. Then, to get rid of the transients, remove the first $N$ elements. Then return the transient-free orbit.
## 2. Obtaining the fixed points for a range of different $a$ values
We will now work in the function `bifurcationdigram.m`. Subsequently, you generate a range of values for $a$. Which range is useful? Then, use an arrayfun to apply the function `fixedpoints` to this range. Is `'UniformOutput', false` needed in this case? Which container type does the output have?
## 3. Plotting a bifurcation diagram
The easiest way to plot a bifurcation diagram is in the form of a scatter plot. In this scatter plot, plot points at coordinates $(a, x)$. Do this by looping. Keep in mind the way you index your container types! 
For clarity's sake, make sure that the points are identically colored and not too large. Furthermore, don't be uncivilized and label your axes. Use a figure handle since you will need to add a second plot underneath it, as well as keeping the debugger happy.
## 4. Plotting the Lyapunov exponent
For our final exercise, we will work in the file titled `lyapunov.m`. Using the previously written function `fixedpoints`, generate an array (or cell array if you so fancy) that contains the Lyapunov coefficient for varying values of `a`. A similar technique as in section 3. is recommended. Plot this one underneath the bifurcation diagram, at the same scale.
## 5. Run the unit tests
Please run the unit tests. Romano didn't spend his Sunday afternoon for you to ignore these :'(.

