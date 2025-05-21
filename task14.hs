module Task14 where

import Test.QuickCheck
import Prelude hiding (drop, foldl, foldr, fst, init, snd, sum, tail, take, (!!), ($))

{-
 - Write a function 'sum' which computes the sum of a (finite)
 - list of numbers, so that for example: sum [2,5,3] == 10.
 -
 - You should not use pattern-matching on binary list constructors
 - here, even if you happen to already know this concept. Instead, use
 - a divide-and-conquer approach. That is, we expect to see something
 - like 'splitAt (length list `div` 2) list' in your solution.
 -
 - Use exactly one equation (maybe with guards) to define 'sum'. If
 - you feel a need to use 'where', use 'let' instead. Indeed, 'let'
 - with a tuple pattern would be quite useful to access both output
 - lists of the call of 'splitAt' at once.
 -}

sum :: [Integer] -> Integer
sum xs = undefined

main :: IO ()
main = do
  putStrLn "If your code does not even satisfy these, there is a problem:"
  quickCheck (sum [] === 0)
  quickCheck (sum [1, 2, 3] === 6)