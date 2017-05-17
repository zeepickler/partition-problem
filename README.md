### Partition Problem Solver

#### The Partition Problem

Given a set of numbers, can you arrange it into two subsets so that the sum of the first subset equals the sum of the second subset? A variation on this problem asks to find two subsets whose sums have a minimal difference.

#### The Algorithm

The 'fast.rb' script in this repo is an algorithm which returns a result when it finds two subsets whose sums are equal. Note that while a single set can have multiple solutions, this algorithm exits on the first solution it finds. When none are found, nothing is returned.

#### Time Complexity of the Algorithm

The fastest known algorithm for this problem (if Wikipedia can be trusted) is a dynamic programming solution that runs in pseudo polynomial time. However, the resulting output is simply a boolean, which tells you whether two subsets exist, but does not output two subsets.

Based on experimental results of this algorithm, it runs in pseudo polynomial time as well with the added benefit of returning actual subset values.

#### How It Works

First, imagine that each element in the set is replaced with a one or zero. One and Zero represent the corresponding subsets. So for a set [4, 5, 6, 7, 8] with subsets [4] and [5, 6, 7, 8] the corresponding binary value is "10000" or 16.

The algorithm starts with assuming the first element belongs to the first set (4 in our example above).  We represent this with the value of 16 (or "10000"). Now, we add up the corresponding subsets for the "10000" case. If our subset total, corresponding to the "1" group, is greater than half the total of the set, we subtract the next lowest binary number (16 - 8). If the total is less than half the total of the set, we add the next lowest binary number (16 + 8). Now, we end up with a new binary number and repeat the process (but use 4 instead of 8). The process iterates until we reach (+/- 1).

After some experimentation, the best results came from 3 nests of iteration (ie. for n elements,  (n - 2) ^ 3 iterations at most occur). Also, in the innermost nest, when we are halfway (ie. 3rd iteration for a set of 6 elements) the binary number calculation is made twice.