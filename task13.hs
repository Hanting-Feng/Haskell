module Task13 where

import Data.Char (toLower)
import Test.QuickCheck
import Prelude hiding (fmap, foldl, foldr, map, (!!), ($), (<$>))

-- Write a function for the given 'isPalindrome' type signature which
-- returns whether the given string is a palindrome.
--
-- A palindrome is a word or collection of words that is the same read
-- forward and backward, such as "racecar", "Zerimar Ramirez", or
-- "Aibohphobia" (the medical term for irrational fear of
-- palindromes).
--
-- Note that our concept of palindromes here ignores whether a letter
-- appears in lower case or upper case.
--
-- By executing 'main' below, you can partially test your solution
-- before uploading it.

isPalindrome :: String -> Bool
isPalindrome c
  | length c < 2 = True
isPalindrome c = toLower (head c) == toLower (last c) && isPalindrome (init (tail c))

main :: IO ()
main = do
  putStrLn "A single character is a palindrome:"
  quickCheck (\c -> isPalindrome [c])
  putStrLn "Adding the same character to the front and back of a string does not change the outcome of isPalindrome:"
  quickCheck (\c str -> isPalindrome ([toLower c] ++ str ++ [c]) === isPalindrome str)
