## Motivation
This is a simple implementation of Conway's game of life in Julia. I wanted to experiment with Tk, Cairo and Image filters. 

## Implementation
The implementation is straightforward and uses convolution to go from one state to the next by using a kernel to calculate the cell neighbors. 
```
1 1 1
1 9 1
1 1 1
```
We can then check if the cell equals `3`, `11` or `12`. This is because the first value represents a dead cell with 3 neighbors while the others represent live cells with 2 or 3 neighbors.

## Next steps
- Profiling
- Caching? (a la Hashlife)

## Inspiration
[@jiffyclub's IPython Notebook](http://nbviewer.ipython.org/gist/jiffyclub/3778422)
@thearn's explanations [here](https://github.com/thearn/game-of-life#how-its-written)