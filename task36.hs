main :: IO ()
main = loop 0
  where
    loop :: Int -> IO ()
    loop count = do
      n1 <- readLn
      if n1 == 0
        then print count
        else do
          n2 <- readLn
          let s = n1 + n2
          print s
          loop (count + 1)