-- length
length' [] = 0
length' (_:xs) = 1 + length' xs

-- sum
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- product
product' [] = 1
product' (x:xs) = x * product' xs

-- take
take' 0 list = []
take' n (x:xs) = [x] ++ take' (n-1) xs

-- reverse
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- drop
drop' 0 list = list
drop' 1 (x:xs) = xs
drop' n (x:xs) = drop' (n-1) xs