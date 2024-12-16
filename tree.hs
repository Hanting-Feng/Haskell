-- 定义树结构
data Tree a = Leaf | Node (Tree a) a (Tree a)
  deriving (Show, Eq)

-- 定义你的树
tree :: Tree Int
tree = Node (Node Leaf 1 Leaf) 2 (Node (Node Leaf 3 Leaf) 4 Leaf)

-- 打印树结构
prettyPrint :: Show a => Tree a -> String
prettyPrint Leaf = "Leaf"
prettyPrint (Node left val right) =
  "(" ++ prettyPrint left ++ " <- " ++ show val ++ " -> " ++ prettyPrint right ++ ")"

-- 主函数
main :: IO ()
main = do
  putStrLn "Tree Structure:"
  putStrLn (prettyPrint tree)
