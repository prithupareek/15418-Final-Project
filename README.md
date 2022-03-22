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
April 2nd: Create Maps; Finish sequential Version of Generation and Connection

April 9th: Finish Generation Phase in Parallel

April 11th: Checkpoint; Finish Visualizer

April 16th: Finish Connection Phase in Parallel

April 23rd: Finish A* in Parallel

April 29th: Report Due

May 5th: Final Presentation