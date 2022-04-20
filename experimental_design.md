# Project Plans

## Overview
This document contains the experiments that will be conducted on our planner to see the speedup (if any) provided by our parallel implementations. Based on our results will be reason about the benefits/drawbacks of a parallel implementation as well as our thoughts as to why the results turned out the way they were.

## Initial Hypothesis
Parallelizing the three phases of PRMS - generation, connection, and query - should result in a faster computation time (speedup > 1) when compared to a sequential implementation.

## Plan of Attack
### Generation Phase
Parallelize using OpenMP (Share-Memory Model) when sampling new points to add to the graph.
### Connection Phase
Parallelize using OpenMP (Shared-Memory Model) when connecting one vertex to all of its neighbors.
### Query Phase
Parallelize using a message passing model where each thread is assigned the responsiblity of one node. *(NOTE: This plan needs to be hashed out more.)*

## Experimental Design
The plan is to test the parallel strategies over a series of maps of different sizes and densities to see how it performs in different circumstances.

### Maps
Different sizes, constant density (medium):
- Small
- Medium
- Large

Different Densities, constant size (medium):
- Empty
- Sparse
- Medium Density
- Dense

### Tests
Test the different maps on 1, 2, 4, 8, 16, 32, and 64 threads. Run all the tests on the PSC machines.