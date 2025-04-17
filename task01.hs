module Task01 where

import CodeWorld
import Prelude hiding (($)) 

scene :: Picture
scene = rechteck & translated 0 5 (rund)

rund :: Picture
rund = colored yellow (solidCircle 1)

rechteck :: Picture
rechteck = colored green (solidRectangle 15 2)

main :: IO ()
main = drawingOf scene