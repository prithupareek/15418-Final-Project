# Parallel Sampling Based Motion Planning using Probabalistic Road Maps (PRMs)
## 15418 Final Project
## Prithu Pareek (ppareek@andrew.cmu.edu) and Omkar Savkur (osavkur@andrew.cmu.edu)

### Summary
We want to implement a parallel version of path planning using Probabalistic Road Maps (PRMs). We would parallelize the Node Generation Phase (determining a node configuration without collisions), the Connection Phase (connecting the nodes into a roadmap), and the Query Phase (finding the optimal path between a desired start and end location using the roadmap).
### Background
Planning the motion of a robot is a challenging task and becomes even more challenging when attempting to plan in unknown envirornments. To solve this issue several motion planning tools - known as sampling based planning algorithms - have been developed. Instead of using an explicit representation of the environment, these algorithms sample random points from a robots state space, check them for validity and use them for planning. The two most popular of these sampling based motion planning algorithms are Probabalistic Road Maps (PRMs) and Rapidly-exploring Random Trees (RRTs). Our project will focus on PRMs.

PRMs work in three stages: Generation, Connection, and Query. In the Generation phase the robot's state space is randomly sampled to generate valid robot states. These states are collision checked for validty and will become nodes in the graph searched for a valid path. Once a set of valid nodes is found, the Connection phase begins. In this phase each node is attemped to be connected to neighboring nodes that are close to it. The nodes that are allowed to be connected to it are determined by a heuristic and all connections between nodes must be collision free paths. Finally we not have a grpah of nodes connected to each other with edges. In the query phase, the start and goal state are attemped to be connected to the graph. Then the graph is searched for a valid path from start to goal using a graph search algorithm (in our case A*).

While PRMs are incredibly useful for motion planning in unknown environments, they can be inefficient, especially when compared to other sampling based planning algorithms like RRTs. This is because of the amount of computation that occurs during the Generation and Connection phases. During the Generation phase, every new node must be checked for collisions which can be computationally intensive, especially as you increase the number of dimmentions in your state space. Furthermore, the quality of your generated path increases with the number of states sampled, which presents a tradeoff between motion optimality and efficiency. The Connection state is also computationally intensive since for every sampled node you need to find all the nodes within a certain range that it should be connected too.

Given these inefficiencies, we think the PRMs would benefit greatly from parallelization.
### Challenge
From a parallelization perspective, we anticipate the Connection Phase and Query Phase to be the harder parts because in the Connection Phase, if one processor wants to connect two nodes in a roadmap, all other processors need to be made aware of this connection so that they can adjust how they decide to connect other nodes together. In the Query Phase, running the graph search (A*) in parallel will require synchronization between the cores at the end to return the best path.
### Resources
We are planning (no pun intended) to use the GHC machines and maybe the PSC machines to run our algorithm across multiple cores to determine what speedup we can get. We would try to our algorithm across multiple map sizes as well as number of obstacles to determine what is our limiting factor in terms of speedup.

### Goals and deliverables
75% Target: Generation and Connection Phases running in parallel with Query Phase running sequentially for a point robot. Including visualizer to show the graphs generated as well as paths returned by A* on the roadmap.

100% Target: Generation, Connection, and Query Phases all working in parallel for a point robot. Including visualizer to show the graphs generated as well as paths returned by A* on the roadmap.

125% Target: Generation, Connection, and Query Phases all working in parallel for a 2 Degree-of-Freedom RR Arm - means a higher number of configuration space dimensions. Including visualizer to show the graphs generated as well as paths returned by A* on the roadmap.

### Schedule
April 2nd: ~~Create Maps; Finish sequential Version of Generation and Connection~~ (Done)

April 9th: ~~Finish Sequential Version of A*~~ (Done), ~~Finish Generation Phase in Parallel (Need to test more)~~

April 11th: ~~Checkpoint; Finish Visualizer~~ (Done)

April 14th: ~~Finalize Generation in Parallel (or not)~~, ~~Write Code for Parallel Connection Phase~~

April 17th: ~~Test and Finish Connection Phase in Parallel~~

April 21st: ~~Write Code for A* in Parallel~~

April 24th: ~~Test and Finish A* in Parallel~~

~~April 29th: Report Due~~ _(assignment deadlines modified due to COVID 19)_

May 5th: Final Presentation and Report Due

### Milestone Report
#### 
**In one to two paragraphs, summarize the work that you have completed so far. (This should be easy if you have been maintaining this information on your project page.)**

We have written the sequential version of our code for the PRM (the generation, connection, and query phases). We have a visualizer to convert the path outputted by the planner into a image with the path overlayed on the map. We can also autogenerate "maps" (text files with open and filled regions of space) from an image file. We started parallelizing the generation phase, where each processor tries to sample points in the configuration space until a set of free points is found.

**Describe how you are doing with respect to the goals and deliverables stated in your proposal. Do you still believe you will be able to produce all your deliverables? If not, why? What about the 'nice to haves'? In your milestone writeup we want an updated list of goals that you plan to hit for the poster session.**

We seem to be relatively on track with respect to our original proposed project schedule. We still have a little more work to do on parallelizing the generation phase, but other than that, we believe that we should be able to stick to our original schedule and accomplish our desired tasks. (Note: We have modified our schedule above to reflect half-week increments and our completed tasks.)

**What do you plan to show at the poster session? Will it be a demo? Will it be a graph?**

For the poster session we plan on showing graphs of the speedups we obtain after parallelizing the various parts of our PRM-based planner. We plan to test our planner on several maps of different sizes and varying start-goal pairs and number of points sampled from the configuration space. In addition to the graphs of the speedup, we also plan on showing visuals of the different paths that were found. These will be shwown along with stats from each planning instance such as path length, and plan time. These will be shown to see the impact of parallelization on the optimality of the path (if these is any).

**Do you have preliminary results at this time? If so, it would be great to included them in your milestone write-up.**

We started parallelizing the generation phase and saw that the overhead of using OpenMP to divide up the sampling amoung the different processors seems to be greater than the time taken for 1 processor at sampling 10000 points from the large1 map (around 33ms for 1 processor, 48ms for 4 processors, and 43ms for 8 processors). We want to run more experiments on the extra large map with very few free spaces and sampling more points to see if in the long-run (with more sampling points) the overhead will be just a small fraction of the time spent sampling points.

**List the issues that concern you the most. Are there any remaining unknowns (things you simply don't know how to solve, or resource you don't know how to get) or is it just a matter of coding and doing the work? If you do not wish to put this information on a public web site you are welcome to email the staff directly.**

We are not entirely sure if it makes sense to parallelize the generation phase, since our initial results points to the fact that there seems to be too much overhead with OpenMP. If we find that after more testing that the generaion phase is still slower in parallel, we will focus more on parallelizing the connection phase
