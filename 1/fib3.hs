fib n = case n of
    1 -> 0
    2 -> 1
    _ | n > 0 -> fib (n-1) + fib (n-2)
