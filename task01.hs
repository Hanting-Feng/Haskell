module Task04 where

import CodeWorld
import Data.Text (pack)
import Prelude hiding (($))

scene :: Double -> Picture
scene t
  | t <= 1 = rechteck & translated (8 * t) (7 * t - 9.81 / 2 * t ^ 2) (rund)
  | otherwise = rechteck & translated 10 0 (rund)

rund :: Picture
rund = translated (-5) 1 (colored yellow (solidCircle 1))

rechteck :: Picture
rechteck = colored green (solidRectangle 15 2)

-- Do not change the stuff below here!
sceneWithTime :: Double -> Picture
sceneWithTime t = countTime t & scene t

main :: IO ()
main = animationOf sceneWithTime

countTime :: Double -> Picture
countTime t = dilated 0.5 (translated 15 (-6) (lettering (pack ("t = " ++ truncatedTime t))))

truncatedTime :: Double -> String
truncatedTime t =
  let (n, f) = properFraction t
   in show (n :: Int) ++ take 3 (tail (show f))
