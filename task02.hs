module Task02 where

import CodeWorld
import Prelude hiding (($)) -- just preventing some syntax that might confuse beginners

-- Draw a picture of a tree similar to:
--
--   https://code.world/run.html?mode=haskell&dhash=DDZ_AqUvWQm3FricOIoNx7A
--
-- Your tree should at least consist of a trunk, two branches and some
-- leaves/crown.
--
-- You can look up how to produce and transform relevant shapes in the
-- CodeWorld documentation and in the example(s) from the lecture.

main :: IO ()
main = drawingOf scene

scene :: Picture
scene = translated 0 (-4.5) (trunk) & branches & translated 0 3 (least)

least :: Picture
least = colored green (solidCircle 5)

trunk :: Picture
trunk = colored brown (solidRectangle 1 10)

branches :: Picture
branches = rotated 45 (colored brown (solidPolygon [(0, 0), (0, 3), (0.5, 3), (0.5, 0)])) & rotated (-45) (colored brown (solidPolygon [(0, 0), (0, 3), (-0.5, 3), (-0.5, 0)]))