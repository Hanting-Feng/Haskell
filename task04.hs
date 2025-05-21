module Task04 where

import CodeWorld
import Prelude hiding (($))
import Data.Text (pack)



scene :: Double -> Picture
scene t | t <= 4 = rechteck & translated (15 * t) (20 * t - 9.81 / 2 * t^2) (rund)
        | otherwise = rechteck & translated 60 0 (rund)

rund :: Picture
rund = colored yellow (solidCircle 3)

rechteck :: Picture
rechteck = translated 30 (-1.5) (colored green (solidRectangle 70 3))

-- Do not change the stuff below here! 
sceneWithTime :: Double -> Picture
sceneWithTime t = countTime t & scene t

main :: IO ()
main = animationOf sceneWithTime

countTime :: Double -> Picture
countTime t = dilated 0.5 (translated 15 (-6) (lettering (pack ("t = " ++ truncatedTime t))))

truncatedTime :: Double -> String
truncatedTime t =
  let (n,f) = properFraction t
  in show (n :: Int) ++ take 3 (tail (show f))




scene :: Double -> Picture
scene t
  | t <= 4 = rechteck & translated x y (rund)
  | otherwise = rechteck & translated 30 0 (rund)
  where
    angle = pi * (1 - t / 4)
    r = 30
    x = r * cos angle
    y = r * sin angle

rund :: Picture
rund = colored yellow (solidCircle 3)

rechteck :: Picture
rechteck = translated 0 (-1.5) (colored green (solidRectangle 70 3))

-- Do not change the stuff below here!
sceneWithTime :: Double -> Picture
sceneWithTime t = countTime t & scene t