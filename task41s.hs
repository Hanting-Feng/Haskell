main :: IO ()
main = loop 0

loop :: Int -> IO ()
loop count = do
  x <- wiederInput "Input x"
  if x == 0 then print count
  else do
    y <- wiederInput "Input y"
    let s = x + y
    print s
    loop (count + 1)

wiederInput :: String -> IO Int
wiederInput s = do
   putStrLn s
   n <- readLn
   if n < 0 then wiederInput s else return n