# Work Logs/Updates

## 04/18/22 18:55
### Prithu & Omkar
- Got connection phase working in parallel, seeing close to linear speedup (with 8 threads or less) - want to test on PSC machines.
- Tried multiple strategies for generation phase in parallel. No luck in speedup for any of the attempts. Concluded that the overhead from OpenMP itself was too high to provide any useful speedup to this part of the PRM algo.
    - First was to try and manually set the blocksize and schedule
    - Tried using dynamic schedule since we could not predict how many iterations the do-while loop would take (We printed it out and it seemed like most points finished within 5 iterations but sporadically would take 20+ iterations)
    - Tried to create a private local copy of the graph and then copy the verticies into the main graph at the end, but got similar results to all of the other attempts.

## 04/25/22 19:30
### Prithu & Omkar
- Resizing Images (Small is 500x500; Medium is 1000x1000; Large is 5000x5000)
- Density Images are still 5000x5000
- Planning on sampling 2%, 5%, 10% of the number of pixels for each map