fun :: (Int -> Int) -> Bool -> Int -> Int 
fun g b n | (not b) && (n < 0) = 0
          |odd n = fun (fun g b) False (g (n `div` 2))
fun g _ n = g (fun(g . g) False (n - 2))