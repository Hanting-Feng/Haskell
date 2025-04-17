module Task03 where

import CodeWorld
import Prelude hiding (($)) -- just preventing some syntax that might confuse beginners

-- Draw the longitudinal section (the vertical version of a cross
-- section) of an egg. You may use the following picture as guidance:
--
--   https://code.world/run.html?mode=haskell&dhash=DantMBam23_YjOgmx241lZw
--
-- Your picture should consist of an oval gray shell surrounding the
-- egg white which has a round, yellow yolk inside.
--
-- (Mathematically, the egg form can simply be an ellipse/stretched circle.)
--
-- You can look up how to produce and transform relevant shapes in the
-- CodeWorld documentation and in the example(s) from the lecture.

main :: IO ()
main = drawingOf scene

scene :: Picture
scene = eigelb & eisweiss

eigelb :: Picture
eigelb = colored yellow (solidCircle 3)

eisweiss :: Picture
eisweiss = scaled 1 1.2 (translated 0 1.5 (colored grey (thickCircle 0.3 6)))
