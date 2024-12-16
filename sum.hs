fac n = aux n 1
	where 
	 aux n acc
	  | n <= 1  = acc
	  | otherwise = aux (n - 1) (n * acc)


asc n m
	| m < n = []
	| m == n = [m]
	| m > n = n : asc (n+1) m

evens [] = []
evens (x : xs)
	| mod x 2 == 0 = x : evens xs
	| otherwise = evens xs

mySum [] = 0
mySum (x : xs) = x + mySum xs

nub [] = []
nub (x:xs) | x `elem` xs = nub xs | otherwise = x : nub xs


isAsc [] = True 
isAsc [x] = True 
isAsc (x:y:xs) = (x <= y) && isAsc (y:xs)



hasPath :: [(Int,Int)] -> Int -> Int -> Bool
hasPath [] x y = x == y
hasPath xs x y 
	| x == y = True 
	| otherwise = 
		let xs' = [(n,m) | (n,m) <- xs, n /= x] in 
			or [hasPath xs' m y | (n,m) <- xs, n == x]