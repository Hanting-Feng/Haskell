
main :: IO ()
main = do
  x <- readLn
  let y = 0
  result <- loop x y
  print result

loop :: Int -> Int -> IO ()
loop x y
  | x <= 0 = print y
  | even x = do
      let x1 = x `div` 3
      print x1
      loop x1 y
  | otherwise = do
      x2 <- readLn
      print x2
      loop x2 (y + 1)
