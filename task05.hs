module Task05 where

import Test.QuickCheck
import Prelude hiding (($))
import Data.ByteString (count)

-- Note that this is the first non-graphical task.
-- (But in principle it also works on CodeWorld.)
--
-- Consider the following function computing
-- Tribonacci numbers:

trib :: Integer -> Integer
trib 0 = 0
trib 1 = 1
trib 2 = 1
trib n = trib (n - 3) + trib (n - 2) + trib (n - 1)

{- Here is a more efficient version written in Python, using
   mutable variables:

def tribonacci(n):
    if n <= 0:
        return 0
    elif n <= 2:
        return 1
    else:
        a, b, c = 0, 1, 1
        count = n - 2
        while count > 0:
            a, b, c = b, c, a + b + c
            count -= 1
        return c

-}

-- Write a Haskell function that follows the same idea, avoiding
-- the inefficiency of having *three* recursive calls for each
-- nontrivial case.
--
-- By executing 'main' below, you can partially test your solution
-- before uploading it.

tribonacci :: Integer -> Integer
tribonacci n = if n <= 0 then 0 
    else if n <= 2 then 1 
    else loop (n-2) 0 1 1
    where 
        loop 0 a b c = c
        loop count a b c = loop (count - 1) b c (a + b + c)
        


main :: IO ()
main = do
  putStrLn "Some simple test cases:"
  quickCheck (tribonacci 5 === 7)
  quickCheck (tribonacci 6 === 13)
  quickCheck (tribonacci 10 === trib 10)
  putStrLn "Checking further cases, while being careful to not go too high:"
  quickCheck (\(NonNegative n) -> (n < 25) ==> (tribonacci n === trib n))