takeWhileAdjacent :: (a -> a -> Bool) -> [a] -> [a]
takeWhileAdjacent _ [] = []
takeWhileAdjacent _ [x] = [x]
takeWhileAdjacent p (x:y:xs)
	|p x y = x : takeWhileAdjacent p (y : xs) 
	|otherwise = [x]