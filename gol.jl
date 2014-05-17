using Base.Graphics
using Cairo
using Tk
using Images

function simulate(size::Int, iter::Int, sparse::Float64=0.1)
    win = Toplevel("Game of Life", size, size)
    c = Canvas(win)
    pack(c, expand=true, fill="both")
    ctx = getgc(c)

    function evolve(grid)
        neighbors = imfilter(grid, [1 1 1; 1 9 1; 1 1 1]);
        ((neighbors .== 11) | (neighbors .==12) | (neighbors .==3)) & 1
    end

    function iterate(N::Int, iter::Int, sparse::Float64)
        grid = (rand(N,N) .< sparse) & 1;
        for i=1:iter
            grid = evolve(grid)
            buf = uint32color(grid .* 255)
            image(ctx,CairoRGBSurface(buf), 0, 0, N, N)
            reveal(c)
            Tk.update();
        end
    end

    iterate(size, iter,sparse);
end
