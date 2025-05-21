module Example07 where

import CodeWorld

main :: IO ()
main = animationOf scene

scene :: Double -> Picture
scene t = cliff & pictures [ ball (x v) (y v) | v <- [2..6] ]
  where x,y :: Double -> Double
        x v = v * t
        y v = 2 * v * t - 9.81 / 2 * t^2
        cliff = polyline [(-5,0),(0,0),(0,-2)]

ball :: Double -> Double -> Picture
ball x y = translated x y (circle 0.1)
