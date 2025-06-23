findElem :: [Integer] -> Bool
findElem (x:y:z:xs) = (x + y == 0 && z == 0) || findElem (y : z :xs)
findElem _ = False -- 只要不是三个或以上元素列表(比如空列表，1个或两个元素的列表) 都返回false