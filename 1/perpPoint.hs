perpPoint (p,q) (a,b,c) = (x,y)
    where
        x = (a*c+b*d)/(a^2+b^2)
        y = (b*c-a*d)/(a^2+b^2)
        d = b*p - a*q