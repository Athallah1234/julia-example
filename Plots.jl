using Plots

# Definisikan fungsi
f(x) = sin(x) + cos(x) + tan(x)

# Buat range x, hindari singularitas tan(x) di ±π/2
ε = 0.01
x = -pi/2 + ε : 0.01 : pi/2 - ε

# Hitung y
y = f.(x)

# Plot
plot(x, y,
    label = "sin(x) + cos(x) + tan(x)",
    xlabel = "x",
    ylabel = "f(x)",
    title = "Grafik sin(x) + cos(x) + tan(x)",
    linewidth = 2,
    legend = :topright,
    grid = true)