pythagoras n = do
    print [(a,b,c)
          | a <- [1..n], b <- [1..n], c <- [1..n],
          a^2 + b^2 == c^2
          ]