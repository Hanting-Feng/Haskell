
insert x xs = insert1 x xs ++ [x] ++ insert2 x xs
         where insert1 x1 xs1 = foldr(\y1 ys1 -> if x1 >= y1 then y1 : ys1 else ys1)[] xs1
	       insert2 x2 xs2 = foldr(\y2 ys2 -> if x2 < y2 then y2 : ys2 else ys2)[] xs2