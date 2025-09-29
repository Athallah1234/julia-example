# Metode Secant dalam Julia
using Printf
using Plots

# Fungsi
f(x) = x^2 - 5x + 6

# Definisi metode secant
function secant(f, x0, x1; maxiter=3, es=0.001)
    Ea = Float64[]        # simpan nilai error
    Xr = Float64[]        # simpan akar aproksimasi
    
    for i in 1:maxiter
        # Rumus secant
        x2 = x1 - (f(x1) * (x0 - x1)) / (f(x0) - f(x1))
        
        # Hitung error aproksimasi
        ea = abs((x2 - x1) / x2) * 100
        
        push!(Ea, ea)
        push!(Xr, x2)
        
        @printf("Iterasi %d: x = %.6f, Ea = %.6f%%\n", i, x2, ea)
        
        # update nilai
        x0, x1 = x1, x2
        
        if ea < es
            break
        end
    end
    
    # ====== Grafik Error ======
    plot(
        1:length(Ea), Ea,
        seriestype=:scatter,
        markersize=6,
        label="Ea (%)",
        xlabel="Iterasi",
        ylabel="Error (%)",
        title="Grafik Error Metode Secant",
        lw=2
    )
    plot!(1:length(Ea), Ea, seriestype=:line, label="Trend Error")
    
    return Xr, Ea
end

# Jalankan fungsi di terminal
secant(f, 2.2, 2.1, maxiter=3, es=0.001)
