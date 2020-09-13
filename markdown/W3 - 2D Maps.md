
# Week 3 - 2D Maps

**Reference Key**: [HK] - Hale and Koçak, [AY] - Aligood and Yorke

## Essentials  from Week 2 — i.e. 1D Maps


- **Notation fundamentals**: 
    - in 1D maps, fixed points come in two breeds, Sinks (also called stable fixed points, attractors) and Sources (unstable fixed points, repellers). See more about **stability of fixed points**, [1.3 AY] , [3.4  HK])
    - Check that you understand the diference between  *hyperbolic* and *non hyperbolic* fixed points. Hyperbolic fixed points determine whether the map contracts or expands. Non hyperbolic fixed points are often accompanied of changes of the dynamics, i.e., bifurcations often co-occur with non hyperbolic fixed points (e.g. **Flip Bifurcation** or **Period Doubling Bifurcation** [HK 3.4])
    - **Fixed point theorem**: If the interval J includes the range I and is included by the map F(I), then there's a fixed point in A. In other symbols:
      - If $I \supset J \wedge F(I) \subset J$ then $I$ has at least one fixed point.
      - Ask yourself: does the fixed point theorem work for 2D dimensions? Does it work for 3? for N?

## 2D Maps

### 2D Linear maps

Deepen your understanding about the behavior of orbits of linear systems, where the only fixed point is at the origin by plugging different possible matrices at **eigshow.m** (section 2.3 of AY). Eigshow shows how a matrix transforms a vector, and also, by extension, the result of iterating a linear map one time with initials conditions in the unit circle. Consider transformations upon iterated application of the linear map in the case of imaginary eigenvalues. What happens with these orbits?

**Linear maps** are particularly useful because they explain the behavior of orbits close to fixed points also in the case of non-linearities. There's a proof that says that **close to fixed points**, non-linear maps are equivalent to the linearization of the map throuh the  **Jacobian Matrix.** (AY section 2.5). That is, the dynamics around the linearized fixed point of a nonlinear map are qualitatively identical. 

More technically, we say that the qualitative behavior of **orbits close to the fixed points** are fully **determined as a function of the eigenvectors and eigenvalues of the linear system** (section AY 2.3 and 2.5). 
- **Eigenvectors determine the direction of orbits** close to the fixed point.
- **Eigenvalues determine the orientation of orbits** along the eigenvectors,  basically if they contract or expand, or do neither (the latter being the 'non hyperbolic fixed point'. Similarly to the 1D case, in 2D maps we find three kinds of fixed points: attractors (or sinks), repellors (or sources) and saddle nodes (which attract in certain directions and contract in others).
    - *Cases to note*:
        - Distinct Real Eigenvalues ([AY] Example 2.5)
        - Repeated Eigenvalue ([AY] Example 2.6)
        - Complex Eigenvalues ([AY] Example 2.7)
- **NOTE:** For the case in higher dimensions, look at the content of theorem 2.11.
- **NOTE:** a simple coordinate transform (translation) can make any point in the phase space an origin of the system of coordinates. The dynamics around the new origin is preserved ([AY] section 2.4).

 ### Stable and Unstable Manifolds [2.6 AY , 15.2 HK]

A manifold is a crucial concept in the study of dynamical systems. In essence, it looks like a piece of $\mathbb{R}^n$, that is, a continuous piece of space. Notice that the concept is general, we can have manifolds in phase space, which contain orbits, or even in parameter space. The states of orbits converging into or diverging from different attractors are described as belonging to a manifold. For a simple case of coexisting stable and unstablemanifolds in a linear system, take a a *saddle fixed point* for a 2D linear map. The *stable manifold* is the $\mathbb{R}^1$ axis that attracts orbits, while the *unstable manifold* repels them. Notice that initial conditions in the manifold lead to orbits that are fully contained in the manifold. 

  **Homoclinic points** are those points where the stable and unstable manifolds cross (figure AY2.24). The existence of one homoclinic point leads to the existence of infinitely many homoclinic points and is a hallmark of sensitivity to initial conditions.


### 2D Non Linear Maps (Hénon map)

The Hénon map is an example of an iterated non-linear 2D map designed as minimal model to study hallmarks of complex dynamical behavior such as **fractal basins of attraction** and **chaotic attractors**. It is constructed as a Poincaré map of a continuous system (which we will be studying in the following lectures). Chapter 2 in [AY] explores the dynamical behavior of 2D linear and non-linear maps for various parameter combinations. 

A discussion of the **chaotic attractors of the Hénon map** is found in chapter 5 of [AY].

In the Hénon map, folding and streching transformations over the phase space leads to **fractal basin boundaries**. The process of folding and stretching can be understood via the example of the horseshoe map in section 5.6 [AY].

In [HK] pg. 458-461 (From theorem 15.8 onwards), there and pg. 465 the Hénon map is deconstructed into, ***stable and unstable manifolds***, ***homoclinic points*** and ***homoclinic orbits***. In page 465 [HK] there is an enlightening discussion about the relationship of the Hénon map and the logistic map. 

## 