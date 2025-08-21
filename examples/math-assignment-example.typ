#import "../src/lib.typ": dtu-math-assignment, lemma, proof, corollary, proposition, solution, math-problem, math-hint, numbered-equation, matrix, theorem, definition, important, note-box

#show: dtu-math-assignment.with(
  course: "01005",
  course-name: "Advanced Engineering Mathematics",
  title: "Assignment 4: Linear Algebra and Analysis",
  due-date: datetime(year: 2024, month: 4, day: 20),
  author: "Your Name",
  semester: "Spring 2024"
)

#math-problem(number: "1", points: "25")[
  Let $A$ be an $n times n$ matrix. Prove that if $A$ is invertible, then $det(A) != 0$.
]

#important([
  This problem requires you to use the relationship between matrix invertibility and determinants. Consider the contrapositive of the statement.
])

#solution([
  We will prove this by contrapositive. Suppose $det(A) = 0$.

  #proof([
    Since $det(A) = 0$, the matrix $A$ has no inverse. This is because if $A$ were invertible, then there would exist a matrix $A^(-1)$ such that $A A^(-1) = I$.

    Taking the determinant of both sides:
    #numbered-equation($det(A A^(-1)) = det(I) = 1$)

    By the multiplicative property of determinants:
    #numbered-equation($det(A) dot det(A^(-1)) = 1$)

    But this would require $det(A) != 0$, which contradicts our assumption that $det(A) = 0$.

    Therefore, if $det(A) = 0$, then $A$ is not invertible.

    By contrapositive, if $A$ is invertible, then $det(A) != 0$.
  ])
])

#math-problem(number: "2", points: "30")[
  Consider the vector space $RR^3$ with the standard inner product. Let $W$ be the subspace spanned by the vectors $bold(v)_1 = (1, 2, 1)$ and $bold(v)_2 = (2, 1, 3)$.

  a) Find an orthonormal basis for $W$.
  b) Find the orthogonal projection of $bold(u) = (1, 1, 1)$ onto $W$.
]

#definition("Orthogonal Projection", [
  The orthogonal projection of a vector $bold(u)$ onto a subspace $W$ is the vector $"proj"_W (bold(u))$ in $W$ that is closest to $bold(u)$.
])

#solution([
  *Part a): Finding an orthonormal basis for $W$*

  We'll use the Gram-Schmidt process on the basis ${bold(v)_1, bold(v)_2}$.

  Step 1: Set $bold(u)_1 = bold(v)_1 = (1, 2, 1)$

  Step 2: Compute $bold(u)_2$:
  #numbered-equation($bold(u)_2 = bold(v)_2 - "proj"_{bold(u)_1} (bold(v)_2)$)

  First, calculate the projection:
  #numbered-equation($"proj"_{bold(u)_1} (bold(v)_2) = (frac(bold(v)_2 dot bold(u)_1, bold(u)_1 dot bold(u)_1)) bold(u)_1$)

  Computing the dot products:
  - $bold(v)_2 dot bold(u)_1 = (2, 1, 3) dot (1, 2, 1) = 2 + 2 + 3 = 7$
  - $bold(u)_1 dot bold(u)_1 = (1, 2, 1) dot (1, 2, 1) = 1 + 4 + 1 = 6$

  Therefore:
  #numbered-equation($"proj"_{bold(u)_1} (bold(v)_2) = frac(7, 6)(1, 2, 1) = (frac(7, 6), frac(7, 3), frac(7, 6))$)

  And:
  #numbered-equation($bold(u)_2 = (2, 1, 3) - (frac(7, 6), frac(7, 3), frac(7, 6)) = (frac(5, 6), -frac(4, 3), frac(11, 6))$)

  Now normalize both vectors:
  - $||bold(u)_1|| = sqrt(6)$, so $bold(e)_1 = frac(1, sqrt(6))(1, 2, 1)$
  - $||bold(u)_2|| = sqrt(frac(25, 36) + frac(16, 9) + frac(121, 36)) = frac(sqrt(30), 3)$

  So $bold(e)_2 = frac(sqrt(30), 10)(5, -8, 11)$
])

#math-hint([
  For part b), use the formula: $"proj"_W (bold(u)) = sum_(i=1)^2 (bold(u) dot bold(e)_i) bold(e)_i$ where ${bold(e)_1, bold(e)_2}$ is the orthonormal basis.
])

#math-problem(number: "3", points: "35")[
  Let $f: RR -> RR$ be defined by $f(x) = x^3 - 3x + 1$.

  a) Find all critical points of $f$.
  b) Classify each critical point as a local maximum, local minimum, or neither.
  c) Determine the global behavior of $f$ as $x -> plus.minus infinity$.
]

#theorem(name: "Second Derivative Test", [
  Let $f$ be twice differentiable at a critical point $c$ (where $f'(c) = 0$). Then:
  - If $f''(c) > 0$, then $f$ has a local minimum at $c$
  - If $f''(c) < 0$, then $f$ has a local maximum at $c$
  - If $f''(c) = 0$, the test is inconclusive
])

#solution([
  *Part a): Finding critical points*

  $f'(x) = 3x^2 - 3 = 3(x^2 - 1) = 3(x-1)(x+1)$

  Setting $f'(x) = 0$: $x = 1$ or $x = -1$

  So the critical points are $x = -1$ and $x = 1$.

  *Part b): Classifying critical points*

  $f''(x) = 6x$

  At $x = -1$: $f''(-1) = -6 < 0$, so $x = -1$ is a local maximum.
  At $x = 1$: $f''(1) = 6 > 0$, so $x = 1$ is a local minimum.

  *Part c): Global behavior*

  As $x -> +infinity$: $f(x) = x^3(1 - 3/x^2 + 1/x^3) -> +infinity$
  As $x -> -infinity$: $f(x) = x^3(1 - 3/x^2 + 1/x^3) -> -infinity$
])

#math-problem(number: "4", points: "10")[
  *Bonus Problem:* Prove that the matrix $A = matrix(1, 2; 3, 4)$ is diagonalizable.
]

#lemma(name: "Eigenvalue-Eigenvector Relationship", [
  If $A$ is an $n times n$ matrix with $n$ distinct eigenvalues, then $A$ is diagonalizable.
])

#solution([
  We need to find the eigenvalues of $A$.

  The characteristic polynomial is:
  #numbered-equation($det(A - lambda I) = det matrix(1-lambda, 2; 3, 4-lambda) = (1-lambda)(4-lambda) - 6 = lambda^2 - 5lambda - 2$)

  Using the quadratic formula:
  #numbered-equation($lambda = frac(5 plus.minus sqrt(25 + 8), 2) = frac(5 plus.minus sqrt(33), 2)$)

  Since we have two distinct real eigenvalues, $A$ is diagonalizable.
])

#corollary([
  Any $2 times 2$ matrix with distinct eigenvalues can be written as $A = P D P^(-1)$ where $D$ is diagonal and $P$ is the matrix of eigenvectors.
])

---

#important([
  *Submission Guidelines:*
  - Show all work clearly for full credit
  - Box your final answers
  - Include appropriate mathematical notation
  - Verify your solutions when possible
])
