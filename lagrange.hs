lagrange :: [(Float, Float)] -> Float -> Float
lagrange xs x = foldl(\acc (xj, y) -> acc + (y * l xj)) 0 xs 
 where 
	l xj = foldl(\acc (xk,_) -> if xj == xk then acc else acc * ((x - xk) / (xj - xk))) 1 xs

f = lagrange [(1.0, 1.0),(2.0, 4.0),(3.0, 9.0)]
