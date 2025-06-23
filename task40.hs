main :: IO ()
main = loop 0
  where
    loop :: Int -> IO ()
    loop count = do
      putStrLn "Input x:"
      x <- readLn
      if x == 0 then print count
	else if (x < 0)
		then do loop count
        else do
          putStrLn "Input y:"
          y <- readLn
	  if (y < 0) then do loop count
          else do 
		let s = x + y
                print s
                loop (count + 1)


