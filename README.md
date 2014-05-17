## Motivation
This is a simple implementation of Conway's game of life in Julia. I wanted to experiment with Tk, Cairo and Image filters. 

##Usage
Import the file into the REPL and call
```
simulate(size::Int, iterations::Int, sparsity::Float = 0.1)
```
Where size creates a size*size game of life board, iterations is the number of steps and sparsity is an optional parameter between `0 and 1` that indicates how populated the initial board is. 

## Implementation
The implementation is straightforward. A live cell is represented by a `1` and a dead cell is represented by a `0`. The iteration uses convolution to go from one state to the next by using the following kernel to calculate the cell neighbors:
```
1 1 1
1 9 1
1 1 1
```
The neighbors grid will thus equal `number of neighbors + cell state + 9`. We can then check if the cell equals `3`, `11` or `12`. This is because the first value represents a dead cell with 3 neighbors while the others represent live cells with 2 or 3 neighbors.

## Next steps
- Profiling
- Caching? (a la Hashlife)

## Inspiration
- [@jiffyclub](http://github.com/jiffyclub)'s [IPython Notebook](http://nbviewer.ipython.org/gist/jiffyclub/3778422)
- [@thearn](http://github.com/thearn)'s explanations [here](https://github.com/thearn/game-of-life#how-its-written)
