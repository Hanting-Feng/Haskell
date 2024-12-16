greet :: IO ()
greet = do
  putStrLn "What is your name?"
  name <- getLine
  putStrLn ("Hello" ++ " " ++ name ++ ".")

