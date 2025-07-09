#set page(paper: "a4", numbering: "1")
#set heading(numbering: "1.1")

= Recurrences

A recurrence is a recursive definition that describes a sequence of numbers. For
example, the sequence $1, 2, 3, ...$ is described by:

$
  T_n := cases(
    1 & "if" n = 1,
    T_(n-1) + 1 & "if" n >= 2,
  )
$

Another example is the Fibonacci sequence, which is defined as:

$
  T_n := cases(
    1 & "if" 1 <= n <= 2,
    T_(n-1) + T_(n-2) & "if" n >= 3,
  )
$

== Approaches for Solving Recurrences

By solving a recurrence, we mean finding a closed-form expression for evaluating
$T_n$. There are general approaches that can work on many types of recurrences,
however, they may not always yield a solution. For two types of recurrences we
also have specific approaches that always work.

=== Guess-and-Verify

This approach involves evaluating values until a pattern emerges. It does not
always work.

+ Evaluate $T_n$ for small values of $n$.
+ Look for a pattern in the results (this might be hard for complicated
  recurrences).
+ Generalize the pattern into a _guess_.
+ _Verify_ the guess by induction.

=== Plug-and-Chug

This approach involves substituting the recurrence into itself until a pattern
emerges. It does not always work.

+ Substitute the recurrence into itself (_plug_).
+ Simplify the result (_chug_). But not too much as it can make it harder to
  spot the pattern.
+ Repeat until a pattern emerges.
+ Verify the pattern by pluggin it into the recurrence one more time.

=== Approach for Linear Recurrences
