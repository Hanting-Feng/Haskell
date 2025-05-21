module Task12 where

import CodeWorld
import Prelude hiding (ceiling, drop, floor, foldMap, foldl, foldr, fromInteger, head, init, last, mconcat, round, splitAt, tail, take, truncate, (!!), ($))

-- Suppose we want to implement a jump & run game. First off, we
-- should care for level design. In a conceptually tiled world, a
-- level can be thought of as a function assigning to each (x,y)
-- position of the (assumed infinite) screen some number representing
-- what occupies that tile space.
--
-- For example (note that this takes a pair as input, not two
-- individual coordinate values):

level :: (Integer, Integer) -> Integer
level (x, y)
  | abs x > 6 || abs y > 5 = 0 -- outside of the level
  | abs x == 6 || abs y == 5 = 1 -- for a block
  | y < 1 && x >= y && abs (x - 2) > 2 = 1
  | y < -1 = 2 -- for water
  | abs y > 2 && abs (x + y - 1) > 5 = 3 -- for a pearl
  | x < -4 && y < 2 = 3
  | otherwise = 4 -- for air

-- We want to produce an actual screen drawing from such a purely
-- mathematical level description. Fortunately, our graphics designers
-- have already done some work:

block, water, pearl, air :: Picture
block = colored (light grey) (solidRectangle 1 1)
water = colored blue (solidRectangle 1 1)
pearl = colored purple (solidCircle 0.3) & air
air = colored (translucent blue) (solidRectangle 1 1)

-- But the remaining work rests with us. The first step is to turn
-- number codes 1, 2, ... used above into the corresponding
-- pictures. That should not be too hard, right? But make sure that
-- your implementation of the following function is total, i.e., gives
-- no non-exhaustiveness warning:

aTile :: Integer -> Picture
aTile n
  | n == 1 = block
  | n == 2 = water
  | n == 3 = pearl
  | n == 4 = air
  | otherwise = blank

-- Then, we can use that function to produce the overall drawing of
-- the level. Our visible screen has x-coordinates from -10 to 10, and
-- likewise for y. And we should really call the 'aTile' function for
-- all (x,y) combinations in that range, not just some smaller part of
-- the screen, because somebody on the team might still change the
-- 'level' function to cover more of the visible screen with
-- interesting stuff, and then we do not want to produce only a part
-- of the drawing.
--
-- So we would have to produce 21 * 21 = 441 individual calls to cover
-- all (x,y) combinations. Surely you can do this more succinctly?
--
-- If you are thinking of using recursion: don't! We have arts people
-- on our game development team and don't want to blow their mind.

scene :: Picture
scene = pictures [translated (fromIntegral x) (fromIntegral y) (aTile (level (x, y))) | x <- [-10 .. 10], y <- [-10 .. 10]]

-- Extra: Design your own level by providing a different 'level'
--        function of type (Integer, Integer) -> Integer.

main :: IO ()
main = drawingOf scene
