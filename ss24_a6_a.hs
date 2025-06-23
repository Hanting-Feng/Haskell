main :: IO ()
main = do
  putStr "Input n \n"
  n <- readLn
  if n > 0 && n < 5 then do
 	result <- loop n 0 []
	print (reverse result)
  else main

loop :: Int -> Int -> [Int] -> IO [Int]
loop 0 _ xs = return xs
loop n x xs = do
  putStr "Input y \n"
  y <- readLn
  if abs y < 4 && odd y then do
	let ys = y : xs
	if x + y == 0
		then return (0 : ys)
		else loop (n - 1) y ys
  else loop n x xs


  -- _______________________________________
  
  
-- 主程序
main1 :: IO ()
main1 = do
  n <- readValidN
  result <- loop n 0 []
  print (reverse result)

-- 读取有效的 n：0 < n < 5
readValidN :: IO Int
readValidN = do
  n <- readLn
  if n > 0 && n < 5
    then return n
    else readValidN -- 不合法就重新读

-- 读取有效的 y：abs y < 4 && odd y
readValidY :: IO Int
readValidY = do
  y <- readLn
  if abs y < 4 && odd y
    then return y
    else readValidY -- 不合法就重新读

-- 主循环
loop1 :: Int -> Int -> [Int] -> IO [Int]
loop1 0 _ xs = return xs
loop1 n x xs = do
  y <- readValidY
  let ys = y : xs
  if x + y == 0
    then return (0 : ys)
    else loop (n - 1) y ys
