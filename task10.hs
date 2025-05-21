module Task10 where

import CodeWorld
import Data.Text
import Prelude hiding (($))

-- Some animation functions are given, and you are not allowed to
-- change them:

animation1 :: Double -> Picture
animation1 t
  | t < 2 = colored red (circle t)
  | otherwise = blank

animation2 :: Double -> Picture
animation2 t
  | t < 3 = rectangle t (t + 2)
  | otherwise = blank

animation3 :: Double -> Picture
animation3 t
  | t < 2 = solidCircle (t / 2)
  | otherwise = blank

-- The following program overlays these animations. Unfortunately,
-- that is not exactly what we want. We want the animations to be
-- "played" one after another, and only afterwards do we want the end
-- notice to be shown. Moreover, we want to scale 'animation2' by a
-- size factor of 2, and we want 'animation3' to be played at half
-- speed.
--
-- The outcome should look as follows:
--
-- https://code.world/run.html?mode=haskell&dhash=DWiaEAgKRHlF5Cg4mKQCv_w
--
-- But remember: You are not allowed to change anything in the
-- definitions of 'animation1', 'animation2' and 'animation3'
-- themselves. You should use them unchanged. And if someone else were
-- to change them, your code in 'scene' should still work with them
-- (assuming that said someone else has not changed the individual
-- animations' durations).
--
-- Of course you *are* allowed to change the conceptual structure and
-- the content of the 'scene' function. But, as always desirable, do
-- make sure that your code causes no non-exhaustiveness warnings.
--
-- There is no need for adding new functions, only change 'scene'.

scene :: Double -> Picture
scene t
  | t <= 2 = animation1 t
  | t <= 5 = dilated 2 (animation2 (t - 2))
  | t < 9 = animation3 (0.5 * (t - 5))
  | otherwise = lettering (pack "The End")

main :: IO ()
main = animationOf scene