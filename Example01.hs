main = print [ fib n | n <- [0..1000] ]

fib 0 = 1
fib 1 = 1
-- fib (n - 1) + fib (n - 2)
fib n = loop (n - 2) 1 1
  where
    loop 0 a b = a + b
    loop n a b = loop (n - 1) b (a + b)


-- fac 0 = 1
-- fac n = n * fac (n - 1)
