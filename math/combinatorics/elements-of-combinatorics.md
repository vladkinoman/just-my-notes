# Elements of combinatorics

> Old note. Date: 18/04/2018

**Theorem** (the main principle of Combinatorics). A set A consists of `k` elements, a set B consists of `m` elements. Then we can construct `m x k` pairs `(a_i, b_i)` taking the first from the A, and the second from the B.

Possible results for each of the four schemes of the **ball selection**:

1. Selection without return and with regard to order:
   $$
   A^k_n = \frac{n!}{(n-k)!}
   $$
Note: if n=k, then it's **permutation**: p = n!. 
2. Selection without return and without regard to order:
   $$
   C^k_n = \frac{A^k_n}{k!} = \frac{n!}{k!(n-k)!}
   $$
3. Selection with return and regard to order:
   $$
   n \cdot n \cdot n \cdot \dots n = n^k
   $$
4. Selection without return and with regard to order.
   $$
   C^k_{n+k-1} = C^{n-1}_{n+k-1}
   $$
   