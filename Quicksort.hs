import Test.QuickCheck

sort :: [Integer] -> [Integer]
sort []   = []
sort list =
  let
    pivot = head list
    smaller = [ x | x <- tail list, x <= pivot ]
    greater = [ x | x <- tail list, x >= pivot ]
  in sort smaller ++ [ pivot ] ++ sort greater

main = do
  quickCheck $ sort [] == []
  quickCheck $ \(Positive n) -> sort [1..n] == [1..n]
  quickCheck $ \(Positive n) -> sort (reverse [1..n]) == [1..n]
  quickCheck $ \xs -> sort (reverse xs) == sort xs
  quickCheck $ \xs ys -> sort (xs ++ ys) == sort (ys ++ xs)
  quickCheck $ \xs -> length (sort xs) == length xs
