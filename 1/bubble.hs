swap [] = []
swap (x:y:xs) =
    | x > y     = (y:x:ys)
    | otherwise = (x:y:ys)
    where
        (y:ys) = swap xs

bubbleSort [] = []
bubbleSort xs = y : bubbleSort yx
    where
        (y:ys) = swap xs