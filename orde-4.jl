# =========================================
# Runge-Kutta Orde 4 untuk Persamaan Diferensial
# y' = 1.3*exp(-x) - 2y
# Kondisi awal: y(0) = 5
# h = 1, hitung hingga x = 2
# =========================================

using Plots

# Definisikan fungsi turunan
f(x, y) = 1.3 * exp(-x) - 2y

# Parameter
h = 1.0
x0 = 0.0
y0 = 5.0
x_end = 2.0

# Buat vektor untuk menyimpan nilai
x = x0:h:x_end
y = zeros(length(x))
y[1] = y0

# Metode Runge-Kutta Orde 4
for i in 1:(length(x)-1)
    k1 = f(x[i], y[i])
    k2 = f(x[i] + h/2, y[i] + h*k1/2)
    k3 = f(x[i] + h/2, y[i] + h*k2/2)
    k4 = f(x[i] + h, y[i] + h*k3)
    y[i+1] = y[i] + (h/6)*(k1 + 2k2 + 2k3 + k4)
end

# Cetak hasil
println("Hasil perhitungan RK4:")
for i in 1:length(x)
    println("x = $(x[i]): y = $(round(y[i], digits=4))")
end

# Plot hasil
plot(x, y,
     label="Solusi RK4",
     xlabel="x", ylabel="y(x)",
     title="Metode Runge-Kutta Orde 4",
     lw=2, marker=:circle)
