import Data.Char (toUpper)

greet :: IO()
greet = do 
	putStrLn "What is your name?"
	name <- getLine
	let uname = map toUpper name
	putStrLn ("Hello " ++ uname ++ "!")

