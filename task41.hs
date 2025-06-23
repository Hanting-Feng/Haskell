main :: IO ()
main = do
  putStrLn "Enter x:"
  x <- readLn
  y <- f x
  z <- f (x + 4)
  if even x then return () else print y
  print z

f :: Integer -> IO Integer
f x = do
  y <-
    if x < 0
      then return 0
      else do
        putStrLn "Enter u:"
        u <- readLn
        putStrLn "Enter v:"
        v <- readLn
        g (v, u)
  return (y + 1)

g :: (Integer, Integer) -> IO Integer
g (x, y)
  | x < y = return 1
  | otherwise = do
      putStrLn "step"
      n <- g (x - 1, y)
      return (n + 1)