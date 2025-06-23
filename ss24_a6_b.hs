main ::IO()
main = do 
	n <- readLn
	printLoop 0 n	
	m <- readLn
	loop m n


loop :: Int -> Int -> IO ()
loop m n = 
	if (m < n) then do
		printLoop 0 m
		z <- readLn 
		loop z m 
	else return ()


printLoop :: Int -> Int -> IO()
printLoop i n = if n >= 0 then do 
	print i 
	printLoop (i + 1) (n - 1)
	else return ()