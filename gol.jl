using Base.Graphics
using Cairo
using Tk
using Images

function runGol(size::Int, iter::Int)
    win = Toplevel("Test", size, size)
    c = Canvas(win)
    pack(c, expand=true, fill="both")
    ctx = getgc(c)

    function evolve(grid)
        neighbors = imfilter(grid, [1 1 1; 1 10 1; 1 1 1]);
        ((neighbors .== 12) | (neighbors .==13) | (neighbors .==3)) & 1
    end

    function iterate(N::Int, iter::Int)
        grid = (rand(N,N) .< 0.1) & 1;
        for i=1:iter
            grid = evolve(grid)
            buf = uint32color(grid .* 255)
            image(ctx,CairoRGBSurface(buf), 0, 0, N, N)
            reveal(c)
            Tk.update();
        end
    end
    iterate(size, iter);
end
