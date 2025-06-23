data RoseTree a = Leaf | Node a [RoseTree a] deriving (Show)

treeMap :: (a -> b) -> RoseTree a -> RoseTree b
treeMap _ Leaf = Leaf
treeMap f (Node x subtrees) = Node (f x) (map (treeMap f) subtrees)

