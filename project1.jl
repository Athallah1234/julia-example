x0 = 0
y0 = 5
h = 1
n = 2 - 0 / h

for i = 1:n
    k1 = 1.3 * exp(-x0) - (2*y0)
    a = x0 + h
    b = y0 + (k1*h)
    k2 = 1.3 * exp(-a) - (2*b)
    y1 = y0 + (0.5*k1 + 0.5*k2)*h
    x1 = x0 + h

    #solusi-analitik
    y = 1.3*exp(-x0) + 3.7*exp(-2*x0)

    ea = abs((y-y1)/y)
    println((i, x1, y1, ea))
end