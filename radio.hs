import Data.IntMap (update)
import Distribution.Compat.CharParsing (chainl1)
data Model = CD (Maybe Channel) | Radio Channel  deriving (Eq, Show)
data Channel = Ch1 | Ch2 | Ch3 deriving (Eq, Show)
initModel :: Model
initModel = CD Nothing

data Msg = F | Plus | Munis

updateModle :: Msg -> Model -> Model
updateModle msg model = case (msg,model)  of
	(F,CD Nothing) -> Radio Ch1
	(F,Radio ch) -> CD (Just ch)
	(F,CD (Just ch)) -> Radio ch 
	(Plus,Radio Ch1) -> Radio Ch2
	(Plus,Radio Ch2) -> Radio Ch3
	(Munis,Radio Ch2) -> Radio Ch1
	(Munis,Radio Ch3) -> Radio Ch2



