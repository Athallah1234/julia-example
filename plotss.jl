using Plots

x = 0:0.01:10

f(x) = x^2 - 5x + 2

y = f.(x)

plot(x, y, 
    label = "y = x^2 - 5x + 2",
    xlabel = "x",
    ylabel = "y",
    legend = :topright,
    grid = true)

savefig("plots.png")