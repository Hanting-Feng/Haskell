module Task15 where

import Test.QuickCheck
import Prelude hiding (all, and, any, drop, elem, filter, fmap, foldl, foldr, fst, map, notElem, or, snd, take, (!!), ($), (<$>))

{-
Write a function 'notElem' for the given type signature which returns
whether an integer is not an element of a given list.

You should not use pattern-matching on binary list constructors or the
empty list, even if you happen to already know this concept.

Use exactly one equation (maybe with guards) to define 'notElem'. If
you feel a need to use 'where', use 'let' instead.

By executing 'main' below, you can test your solution before uploading
it.
-}

notElem :: Integer -> [Integer] -> Bool
notElem v xs
  | null xs = True
  | v == head xs = False
  | otherwise = notElem v (tail xs)

main :: IO ()
main = do
  putStrLn "Empty list does not contain anything:"
  quickCheck (`notElem` [])
  putStrLn "Singleton list [x] contains x:"
  quickCheck (\x -> not (notElem x [x]))
  putStrLn "Singleton list [y] does not contain x if x /= y:"
  quickCheck (\x y -> x /= y ==> notElem x [y])
  putStrLn "A combined list lacks v exactly if it is not contained in either of the separate lists:"
  quickCheck (\v xs ys -> notElem v (xs ++ ys) === (notElem v xs && notElem v ys))
