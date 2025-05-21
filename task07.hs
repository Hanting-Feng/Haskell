module Task07 where

import CodeWorld
import Prelude hiding (($))

-- This time we want to draw an Easter themed image. Create the scene
-- of an egg hunt: many differently colored eggs of different sizes
-- are "hidden" inside a garden.
--
-- You can use the following picture as a reference:
--
--   https://code.world/run.html?mode=haskell&dhash=Dm6BmessB7_uexuGH4ILOVg
--
-- Your picture should obviously contain multiple eggs. You can
-- include as many eggs as you want, but there should be at least 6.
-- All of them should have uniquely colored shells and they should
-- vary in size. They should be spread out above a lawn (green solid
-- rectangle). It's okay if the eggs float above the grass a
-- bit. They do not have to touch the ground.
--
-- You can re-use your egg from Task03 if you like. If you do,
-- note that the eggs in the new picture do not contain an egg yolk.
--
-- For this task, you are not allowed to freely add definitions.
-- You can and should only modify occurrences of 'undefined' below.
-- Adding anything else will result in your submission being rejected.
--
-- Hint: Placing all of the eggs individually would be a lot of
--       unnecessary work. Try to define the scene more abstractly
--       (maybe review the lecture slides for ideas).

main :: IO ()
main = drawingOf scene

scene :: Picture
scene = translated 0 (-2.5) (colored green (solidRectangle 30 2)) & egg
  where
    egg :: Picture
    egg = scaled 1 1.2 (translated 0 0 (colored red (thickCircle 0.1 1))) & scaled 1 1.5 (translated 2.5 0 (colored blue (thickCircle 0.1 0.5))) & scaled 1 1.2 (translated (-5) 0 (colored green (thickCircle 0.1 1))) & scaled 1 1.2 (translated (-8) 0 (colored purple (thickCircle 0.1 0.8))) & scaled 1 1.5 (translated 4 0 (colored orange (thickCircle 0.1 0.5))) & scaled 1 1.2 (translated 6 0 (colored brown (thickCircle 0.1 0.8)))





main :: IO ()
main = drawingOf (pictures [scene d | d <- [1 .. 6]])

scene :: Double -> Picture
scene d = translated 100 (-17) (colored green (solidRectangle 250 2)) & scaled d (1.2 * d) (colored (cycleColors d) ((translated (2 * d) 0 (egg))))
  where
    egg :: Picture
    egg = thickCircle 0.1 1
    cycleColors :: Double -> Color
    cycleColors x = [red, green, blue, orange, purple, brown] !! round (x - 1)



main :: IO ()
main = drawingOf scene

scene :: Picture
scene = grass & pictures ([colored col (scaled size size (translated x y egg)) | (col, size, (x, y)) <- [ (red, 0.7, (-11, 4))
           , (blue, 0.6, (-7, 4))
           , (yellow, 0.7, (4, 4))
           , (purple, 0.8, (8, 4))
           , (orange, 0.6, (-3, 4))
           , (pink, 0.5, (1, 4))
           ]])
  where
    grass = colored green (solidRectangle 20 2)

    egg :: Picture
    egg = scaled 1 1.3 (thickCircle 0.2 1.5)
