using ForwardDiff

function newtonraphson(xi, es)
    for i = 1:1000
    f(xi) = xi^2-5*xi+6
    y = f(xi)
    g = ForwardDiff.derivative(xi -> f(xi), xi)
    xii = xi - (y/g)
    ea = abs((xii - xi)/xii)
    println(i, xi, xii, ea)
    if ea < es
        break
    end
    xi = xii
    end
end