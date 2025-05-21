module Task11 where

import CodeWorld
import Data.Bits (Bits (rotate))
import Prelude hiding ((!!), ($))

-- Let's revisit our egg hunt image, but turn it into an animation
-- now.
--
-- Make all of the Easter eggs gently rock to both sides, in an
-- endless motion. You could think of this as being "swayed by the
-- wind". The eggs may touch or even clip into the lawn during their
-- swaying, so don't be too bothered about that. The resulting
-- animation should look similar to this example:
--
-- https://code.world/run.html?mode=haskell&dhash=DGPtiZDKmhISd5WYhXcHpxA
--
-- This task is of course quite similar to Task07. A solution to
-- that other task based on usage of a list comprehension should be
-- particularly easy to reuse and adapt here.

main :: IO ()
main = animationOf scene

scene :: Double -> Picture
scene t = colored red (egg t) & dilated 1.2 (translated 2.5 0 (colored blue (egg t))) & dilated 0.8 (translated (-5) 0 (colored green (egg t))) & translated (-8) 0 (colored purple (egg t)) & dilated 0.8 (translated 8 0 (colored orange (egg t))) & translated 10 0 (colored brown (egg t)) & grass
  where
    grass = translated 0 (-2.5) (colored green (solidRectangle 30 2))
    egg :: Double -> Picture
    egg r = translated 0 (-1.2) (rotated (pi / 4 * sin r) (translated 0 1.2 (scaled 1 1.2 (thickCircle 0.1 1))))



main :: IO ()
main = animationOf scene

scene :: Double -> Picture
scene t = pictures [colored col (dilated size (translated x y (egg t))) | (col, size, (x, y)) <- egges] & grass
  where
    grass = translated 0 (-2.5) (colored green (solidRectangle 30 2))
    egg :: Double -> Picture
    egg r = translated 0 (-1.2) (rotated (pi / 4 * sin r) (translated 0 1.2 (scaled 1 1.2 (thickCircle 0.1 1))))

    egges = [(red, 1, (0, 0)), (blue, 1.2, (2.5, 0)), (green, 0.8, (-5, 0)), (purple, 1, (-8, 0)), (orange, 0.8, (8, 0)), (brown, 1, (10, 0))]