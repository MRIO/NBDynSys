# Cell arrays
Most of the optimizations present in MATLAB are based on the assumption that the data provided is in the form of a matrix and is therefore square or rectangular in shape. However, this is sometimes not sufficient. For this purpose, the clever folks at MathWorks introduced what is known as the Cell Array, often confusingly referred to as a `cell`. The `cell` is a *linear*, *random-access* data collection able to contain *arbitrary types*.
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
**Disclaimer**:
The cell array is often, if not always, significantly slower than natively using vectors. The reason for this is that the MATLAB interpreter has to do many different checks on the data. If for example you want to take the sum of all elements in a cell array, the interpreter has to check if the `+` operator is even defined for all the types in the cell. In order to optimize for speed, it is better to use arrays. If we instruct you to use a cell array, be assured that there is no faster way, or, if there is a faster way, we find that this way obfuscates the main idea of the exercise.

