import Data.Maybe

safediv a b = if b == 0 then Nothing else Just (div a b)

safeDiv :: Float -> Float -> Maybe Float
safeDiv _ 0 = Nothing
safeDiv x y = Just (x / y)

describeMaybe :: Maybe String -> String
describeMaybe Nothing = "No value provided."
describeMaybe (Just s) = "The value is" ++ s


