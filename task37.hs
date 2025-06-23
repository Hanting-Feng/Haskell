data Tree = Leaf Bool | Node Tree Tree
  deriving (Eq, Show)

data Bit = O | I
  deriving (Eq, Show, Enum, Bounded)

encode :: Tree -> [Bit]
encode (Leaf b) = [O, bool2bit b]
encode (Node l r) = I : encode l ++ encode r

bool2bit :: Bool -> Bit
bool2bit False = O
bool2bit True = I

decode :: [Bit] -> Maybe Tree
decode (O:xs) = Nothing
decode (I:a:b:xs) =
    case (a,b) of
    (O,O) -> Leaf False
    (O,I) -> Leaf True
    decode xs