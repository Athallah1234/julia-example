using Printf
using Plots

# Fungsi f(x)
f(x) = x^2 - 5x + 6

# Implementasi metode Secant
function secant_method(f, x0, x1; max_iter=3, es=0.001)
    ea_list = Float64[]
    x_values = [x0, x1]

    @printf("%-10s %-15s %-15s\n", "Iterasi", "Akar (xi)", "Error (Ea)")
    for i in 1:max_iter
        # Rumus Secant
        x2 = x1 - f(x1) * (x0 - x1) / (f(x0) - f(x1))

        # Error relatif
        ea = abs((x2 - x1) / x2) * 100
        push!(ea_list, ea)
        push!(x_values, x2)

        @printf("%-10d %-15.6f %-15.6f\n", i, x2, ea)

        # Update
        x0, x1 = x1, x2

        # Jika sudah cukup kecil, berhenti
        if ea < es
            break
        end
    end
    return x_values, ea_list
end

# Inisialisasi
x0 = 2.2
x1 = 2.1

x_values, ea_list = secant_method(f, x0, x1; max_iter=3, es=0.001)

# Plot Error (Ea)
plot(1:length(ea_list), ea_list, marker=:o, xlabel="Iterasi", ylabel="Ea (%)",
     title="Error Relatif pada Metode Secant", legend=false)
