main :: IO()
main = do
	i <- getLine
	if i /= "quit" then do
		putStrLn("Input:" ++ i)
		main --递归调用 main 函数
	else
		return ()



main1 :: IO ()
main1 = loop 0 -- 初始和为 0

loop :: Int -> IO ()
loop sum = do
  putStrLn "Enter a number (or type 'quit' to exit):"
  input <- getLine
  if input /= "quit"
    then do
      let number = read input :: Int -- 将输入字符串转换为整数
      let newSum = sum + number -- 更新累积和
      putStrLn ("Input: " ++ input ++ ", Current Sum: " ++ show newSum)
      loop newSum -- 递归调用，传递更新后的和
    else do
      putStrLn ("Final Sum: " ++ show sum) -- 打印最终的累积和, show 将 int 类型的 sum 转换成字符串类型
      return ()



count :: Int -> Int -> IO()
count n m = do
	putStrLn (show n) -- 使用 show 将 Int 类型的 n 转换为字符串，便于 putStrLn 输出
	if n < m then count (n + 1) m else return ()