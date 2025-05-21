import CodeWorld

main :: IO ()
main = animationOf combinedScene

combinedScene t = scene t & quickerScene t

scene :: Double -> Picture
scene t
      = circle 0.1
      & translated t 0 (form red)
      & form blue
 where form c = colored c triangle

quickerScene :: Double -> Picture
quickerScene t = scene (5 * t)


triangle :: Picture
triangle = polygon [(0,0),(1,-0.5),(1,0.5)]
