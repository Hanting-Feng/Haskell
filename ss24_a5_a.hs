data Fallible a = Failed String | Okay a
data Salary = NoSalary | Salary Int Bonus
data Bonus = NoBonus | MonthlyBonus Int | YearlyBonus Int

convert (Left s)      = Failed s
convert (Right a)     = Okay (convert' a)

convert' Nothing      = NoSalary
convert' (Just (i,b)) = Salary i (convert'' b)

convert'' Nothing         = NoBonus
convert'' (Just (Left b)) = MonthlyBonus b
convert'' (Just (Right b)) = YearlyBonus b
