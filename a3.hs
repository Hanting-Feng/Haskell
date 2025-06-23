import Distribution.Simple.Utils (xargs)
insert :: (Foldable t, Ord a) => a -> t a -> [a]
insert x xs = insert1 x xs ++ [x] ++ insert2 x xs
	where
		insert1 x = foldr(\y ys -> if x >= y then y : ys else ys) [] 
		insert2 x = foldr(\y ys -> if x < y then y : ys else ys) []



test :: [Integer] -> Bool
test _ = False

test (x : y : z : zs) = x + y == 0 && z == 0 || test (y : z : zs)



takeWhileA _ [] = []
takeWhileA _ [x] = [x]
takeWhileA p (x : y: xs) = if p x y then x : (takeWhileA p (y:xs)) else [x]