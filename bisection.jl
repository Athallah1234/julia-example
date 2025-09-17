function bisection(xl, xu, es)
    for i = 1:1000
    fxl = (xl.^2).-(5*xl).+6 
    fxu = (xu.^2).-(5*xu).+6
    
    if fxl * fxu > 0
        break
    end

    xm = (xl + xu)/2
    fxm = (xm.^2).-(5*xm).+6
    
    if fxl*fxm < 0
        xu = xm
    else 
        xl = xm
    end

    xm1 = (xl + xu)/2

    ea = abs((xm1-xm)/xm1)

    if ea < es 
        break
    end

    println((i, xl, xu, xm1, ea))

    end
end