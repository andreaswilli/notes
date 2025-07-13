#set page(paper: "a4", numbering: "1")
#show heading.where(level: 1): set heading(numbering: (..nums) => (
  "Chapter " + numbering("1.1", ..nums.pos()) + "   "
))
#show heading.where(level: 2): set heading(numbering: (..nums) => {
  "Problem " + numbering("1.1", ..nums)
})
#show heading.where(level: 2): it => block(
  fill: rgb("d2ecf4"),
  inset: 4pt,
  above: 25pt,
  below: 15pt,
  width: 100%,
  text(it),
)
#show raw: it => box(
  fill: rgb("eee"),
  inset: if it.block { 10pt } else { 4pt },
  baseline: 4pt,
  radius: 2pt,
  math.mono(text(it)),
)
#set table(inset: (x: 10pt, y: 5pt), align: right, stroke: (x, y) => (
  left: if x == 0 { none } else { 1pt },
  bottom: if y == 0 { 1pt } else { none },
))

= A Tour of Computer Systems

==

*A.* We use the formula with $alpha = 3/5$ and $k = 150/100 = 3/2$.

$
  S & = 1 / ((1 - 3/5) + 3/5 dot 2/3) \
    & = 1 / (2/5 + 2/5)               \
    & = 5/4                           \
    & = 1.25 times                    \
$

*B.* We use the formula and work our way back:

$
  5/3 & = 1 / ((1 - 3/5) + 3/(5k)) \
  3/5 & = 2/5 + 3/(5k)             \
  1/5 & = 3/(5k)                   \
    1 & = 3/k                      \
    k & = 3                        \
$

So the drive through Montana needs a speedup of $3 times$ which is $300$ km/hr.

==

Use the formula with $alpha = 4/5$ and $S = 2$ and solve for $k$.

$
             2 & = 1 / ((1 - 4/5) + 4/(5k)) \
  2/5 + 8/(5k) & = 1                        \
        8/(5k) & = 3/5                      \
           1/k & = 3/8                      \
             k & = 8/3                      \
$

= Representing and Manipulating Information

==

*A.* `0x39A7F8` to binary: `0011 1001 1010 0111 1111 1000` \
*B.* `1100100101111011` to hexadecimal: `0xC97B` \
*C.* `0xD5E4C` to binary: `1101 0101 1110 0100 1100` \
*D.* `1001101110011110110101` to hexadecimal: `0x26E7B5` \

==

#table(
  columns: 3,
  table.header([*$n$*], [*$2^n$ (decimal)*], [*$2^n$ (hexadecimal)*]),
  [`9`], [`512`], [`0x200`],
  [`19`], [`524288`], [`0x80000`],
  [`14`], [`16384`], [`0x4000`],
  [`16`], [`65536`], [`0x10000`],
  [`17`], [`131072`], [`0x20000`],
  [`5`], [`32`], [`0x20`],
  [`7`], [`128`], [`0x80`],
)

==

#table(
  columns: 3,
  table.header([*Decimal*], [*Binary*], [*Hexadecimal*]),
  [`0`], [`0000 0000`], [`0x00`],
  [`167`], [`1010 0111`], [`0xA7`],
  [`62`], [`0011 1110`], [`0x3E`],
  [`188`], [`1011 1100`], [`0xBC`],
  [`55`], [`0011 0111`], [`0x37`],
  [`136`], [`1000 1000`], [`0x88`],
  [`243`], [`1111 0011`], [`0xF3`],
  [`82`], [`0101 0010`], [`0x52`],
  [`172`], [`1010 1100`], [`0xAC`],
  [`231`], [`1110 0111`], [`0xE7`],
)

==

*A.* `0x503c` $+$ `0x8` $=$ `0x5044` \
*B.* `0x503c` $-$ `0x40` $=$ `0x4ffc` \
*C.* `0x503c` $+$ `64` $=$ `0x507c` \
*D.* `0x50ea` $-$ `0x503c` $=$ `0xae` \

==

#table(
  columns: 3,
  table.header([], [*Little endian*], [*Big endian*]),
  [*A.*], [`21`], [`87`],
  [*B.*], [`21 43`], [`87 65`],
  [*C.*], [`21 43 65`], [`87 65 43`],
)

==

*A.*

`0x00359141` in binary: `0000 0000 0011 0101 1001 0001 0100 0001` \
`0x4A564504` in binary: `0100 1010 0101 0110 0100 0101 0000 0100`

*B.*

```
00000000001101011001000101000001
  01001010010101100100010100000100
           *********************
```
There are 21 matching bits.

*C.*

The whole integer occurs in the float representation, except for the
most-significant bit which is a 1. Similarly, some of the most-significant bits
of the float representation do not occur in the int representation.

==

It prints `61 62 63 64 65 66` (it does not print the terminating null character
because the `strlen` function does not count it).

==

#table(
  columns: 2,
  align: center,
  table.header([*Operation*], [*Result*]),
  [`a`], [`[01101001]`],
  [`b`], [`[01010101]`],
  [`~a`], [`[10010110]`],
  [`~b`], [`[10101010]`],
  [`a & b`], [`[01000001]`],
  [`a | b`], [`[01111101]`],
  [`a ^ b`], [`[00111100]`],
)

==

*A.* The following colors completent each other:

Black $arrow.l.r$ White \
Blue $arrow.l.r$ Yellow \
Green $arrow.l.r$ Magenta \
Cyan $arrow.l.r$ Red \

*B.*

Blue | Green = Cyan \
Yellow & Cyan = Green \
Red ^ Magenta = Blue \

==

#table(
  columns: 3,
  align: (left + horizon, center, center),
  table.header([*Step*], [*$*$x*], [*$*$y*]),
  [Initially], [`a`], [`b`],
  [Step 1], [`a`], [`a ^ b`],
  [Step 2], [`a ^ (a ^ b) = b`], [`a ^ b`],
  [Step 3], [`b`], [`b ^ (a ^ b) = a`],
)

==

*A.* In the final iteration we have `first = k` and `last = k` (swap the middle
element with itself).

*B.* In this case `*x` and `*y` point to the same address and the steps become:

#table(
  columns: 3,
  align: (left + horizon, center, center),
  table.header([*Step*], [*$*$x*], [*$*$y*]),
  [Initially], [`a`], [`a`],
  [Step 1], [`a ^ a = 0`], [`a ^ a = 0`],
  [Step 2], [`0 ^ 0 = 0`], [`0 ^ 0 = 0`],
  [Step 3], [`0 ^ 0 = 0`], [`0 ^ 0 = 0`],
)

*C.* We can fix it by changing the condition to `first < last` since the middle
element does not need to be swapped anyway.

==

*A.* `x & 0xFF` leaves the least significant byte and sets everything else to
zero. \
*B.* `x ^ ~0xFF` inverts everything except the least significant byte. \
*C.* `x | 0xFF` sets the least significant byte to ones and leaves everything
else. \

==

`x | y` is equivalent to `bis(x, y)`. \
`x ^ y` is equivalent to `bis(bic(x, y), bic(y, x))`. \

==

We have `x = 0110 0110` and `y = 0011 1001`.

#table(
  columns: 4,
  align: left,
  table.header([*Expression*], [*Value*], [*Expression*], [*Value*]),
  [`x & y`], [`0010 0000`], [`x && y`], [`1`],
  [`x | y`], [`0111 1111`], [`x || y`], [`1`],
  [`~x | ~y`],
  [`1111 1111 1111 1111 1111 1111 1101 1111` (assuming 32-bit int)],
  [`!x || !y`],
  [`0`],

  [`x & !y`], [`0`], [`x && ~y`], [`1`],
)

==

`!(x ^ y)` is equivalent to `x == y` because `x ^ y` will be `0` only if all the
bits match.

==

#table(
  columns: 4,
  table.header(
    [*x*], [*x << 3*], [*x >> 2 (logical)*], [*x >> 2 (arithmetic)*]
  ),
  [`0xC3 = 1100 0011`],
  [`0001 1000 = 0x18`],
  [`0011 0000 = 0x30`],
  [`1111 0000 = 0xF0`],

  [`0x75 = 0111 0101`],
  [`1010 1000 = 0xA8`],
  [`0001 1101 = 0x1D`],
  [`0001 1101 = 0x1D`],

  [`0x87 = 1000 0111`],
  [`0011 1000 = 0x38`],
  [`0010 0001 = 0x21`],
  [`1110 0001 = 0xE1`],

  [`0x66 = 0110 0110`],
  [`0011 0000 = 0x30`],
  [`0001 1001 = 0x19`],
  [`0001 1001 = 0x19`],
)

==

#table(
  columns: 4,
  align: right + horizon,
  table.header([*Hexadecimal*], [*Binary*], [*$B 2 U_4(x)$*], [*$B 2 T_4(x)$*]),
  [`0xE`], [`[1110]`], [$2^3 + 2^2 + 2^1 = 14$], [$-2^3 + 2^2 + 2^1 = -2$],
  [`0x0`], [`[0000]`], [$0$], [$0$],
  [`0x5`], [`[0101]`], [$2^2 + 2^0 = 5$], [$2^2 + 2^0 = 5$],
  [`0x8`], [`[1000]`], [$2^3 = 8$], [$-2^3 = -8$],
  [`0xD`], [`[1101]`], [$2^3 + 2^2 + 2^0 = 13$], [$-2^3 + 2^2 + 2^0 = -3$],
  [`0xF`],
  [`[1111]`],
  [$2^3 + 2^2 + 2^1 + 2^0 = 15$],
  [$-2^3 + 2^2 + 2^1 + 2^0 = -1$],
)

==

*A.* `0x2e0 = 736` \
*B.* `-0x58 = -88` \
*C.* `0x28 = 40` \
*D.* `-0x30 = -48` \
*E.* `0x78 = 120` \
*F.* `0x88 = 136` \
*G.* `0x1f8 = 504` \
*H.* `0xc0 = 192` \
*I.* `-0x48 = -72` \

==

#table(
  columns: 2,
  align: right,
  table.header([*$x$*], [*$T 2 U_4(x)$*]),
  [$-8$], [$8$],
  [$-3$], [$2^3 + 2^2 + 2^0 = 13$],
  [$-2$], [$2^3 + 2^2 + 2^1 = 14$],
  [$-1$], [$2^3 + 2^2 + 2^1 + 2^0 = 15$],
  [$0$], [$0$],
  [$5$], [$5$],
)

==

Equation 2.5 can be used to solve the previous problem. Since $omega=4$, we need
to add $2^4 = 16$ to all negative numbers in Two's Complement. For example,
$-8 + 16 = 8$ and $-1 + 16 = 15$. Positive numbers (and zero) stay the same.

==

#table(
  columns: 3,
  align: left,
  table.header([*Expression*], [*Type*], [*Evaluation*]),
  [$-2147483647-1 == 2147483648"U"$], [Unsigned], [$1$],
  [$-2147483647-1 < 2147483647$], [Signed], [$1$],
  [$-2147483647-1"U" < 2147483647$], [Unsigned], [$0$],
  [$-2147483647-1 < -2147483647$], [Signed], [$1$],
  [$-2147483647-1"U" < -2147483647$], [Unsigned], [$1$],
)

==

*A.* $[1011] = -2^3 + 2^1 + 2^0 = -5$ \
*B.* $[11011] = -2^4 + 2^3 + 2^1 + 2^0 = -5$ \
*C.* $[111011] = -2^5 + 2^4 + 2^3 + 2^1 + 2^0 = -5$ \

==

#table(
  columns: 3,
  align: center,
  table.header([*`w`*], [*`fun1(w)`*], [*`fun2(w)`*]),
  [`0x00000076`], [`0x00000076`], [`0x00000076`],
  [`0x87654321`], [`0x00000021`], [`0x00000021`],
  [`0x000000C9`], [`0x000000C9`], [`0xFFFFFFC9`],
  [`0xEDCBA987`], [`0x00000087`], [`0xFFFFFF87`],
)

`fun1` keeps only the least significant byte and sets the other three to all
zeroes, resulting in a value between 0 and 255. `fun2` also extracts the least
significant byte, but it performs sign extension instead of zero extension,
which results in a value between -128 and 127.

==

#table(
  columns: 6,
  align: center,
  table.header(
    table.cell([*Hex*], colspan: 2),
    table.cell([*Unsigned*], colspan: 2),
    table.cell([*Two's complement*], colspan: 2),
  ),
  [Original], [Truncated], [Original], [Truncated], [Original], [Truncated],
  table.hline(),
  [0], [0], [0], [0], [0], [0],
  [2], [2], [2], [2], [2], [2],
  [9], [1], [9], [1], [-7], [1],
  [B], [3], [11], [3], [-5], [3],
  [F], [7], [15], [7], [-1], [-1],
)

We can use the equations to verify these results. For example, in hex F
truncates to 7, in unsigned $B 2 U_4(1111) mod 2^3 = 7$ and in two's complement
$U 2 T_3(B 2 U_4(1111) mod 2^3) = -1$.

==

Because `length` is unsigned the expression $0 - 1$ evaluates to UMax. The
comparison has an unsigned integer on one side, which means the other side will
also be treated as unsigned. Of course every unsigned number is $<=$ UMax and so
we try to access invalid array elements.

We can fix it by changing the condition to `i < length` or changing `length` to
a signed integer.

==

*A.* The function returns wrong results in case `t` is longer than `s`.

*B.* The problem is that `strlen` returns a `size_t` which is unsigned. When
calculating `strlen(s) - strlen(t)` where `t` is longer than `s` unsigned
arithmetic is used, resulting in a number close to UMax instead of a negative
number. This is obviously greater than 0 so the function incorrectly says that
`s` is longer.

*C.* We can fix it by changing the condition to `strlen(s) > strlen(t)`.

==

```c
/* Determine whether arguments can be added without overflow */
int uadd_ok(unsigned x, unsigned y) {
  return x + y >= x;
}

```

==

#table(
  columns: 4,
  align: center,
  table.header(
    table.cell([*$x$*], colspan: 2), table.cell([*$-^u_omega x$*], colspan: 2)
  ),
  [*Hex*], [*Decimal*], [*Decimal*], [*Hex*],
  table.hline(),
  [0], [0], [0], [0],
  [5], [5], [11], [B],
  [8], [8], [8], [8],
  [D], [13], [3], [3],
  [F], [15], [1], [1],
)

==

#table(
  columns: 5,
  align: center,
  table.header($x$, $y$, $x+y$, $x +^t_5 y$, [Case]),
  [-12], [-15], [-27], [5], [1],
  [[10100]], [[10001]], [[100101]], [[00101]], [],
  table.hline(),
  [-8], [-8], [-16], [-16], [2],
  [[11000]], [[11000]], [[110000]], [[10000]], [],
  table.hline(),
  [-9], [8], [-1], [-1], [2],
  [[10111]], [[01000]], [[111111]], [[11111]], [],
  table.hline(),
  [2], [5], [7], [7], [3],
  [[00010]], [[00101]], [[000111]], [[00111]], [],
  table.hline(),
  [12], [4], [16], [-16], [4],
  [[01100]], [[00100]], [[010000]], [[10000]], [],
)

==

```c
/* Determine whether arguments can be added without overflow */
int tadd_ok(int x, int y) {
  int sum = x + y;

  if (x > 0 && y > 0) {
    return sum > 0;
  }

  if (x < 0 && y < 0) {
    return sum < 0;
  }

  return 1;
}
```

==

$"sum" - x$ can overflow again, since it's another two's complement addition.
For example, if $x$ and $y$ are large positive numbers whose sum overflows to a
negative number, then $"sum" - x$ will cause a negative overflow "wrapping back
around" to $y$. So this check will not detect the overflow.

==

The function will be incorrect for $y = "TMin"_omega$. This is because the two's
complement representation is not symmetric. $-y = -"TMin"_omega = "TMin"_omega$
causes an overflow possibly resulting in an incorrect return value.
