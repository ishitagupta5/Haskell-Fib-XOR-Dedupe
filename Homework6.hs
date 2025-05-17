--this allows the main to "find" our functions
module Homework6 where
--rename this file Homework6.hs
--compile it like: ghc hw6-main.hs

--remove_duplicates
remove_duplicates :: (Eq a) => [a] -> [a]
remove_duplicates []     = []
remove_duplicates (x:xs)
  | x `elem` xs = remove_duplicates xs     -- skip x if it appears again later
  | otherwise   = x : remove_duplicates xs -- keep x if it does not appear again

--helper for xor
--use this as-is
xor2 :: (Eq a,Num a) =>  a -> a -> a
xor2  x y  
  | x == 0 && y == 0 = 0
  | x == 0 && y == 1 = 1
  | x == 1 && y == 0 = 1
  | x == 1 && y == 1 = 0

--start of the fib function
--it takes a function t and a list of values
xor :: (Foldable t, Eq b, Num b) => t b -> b
xor xs = foldr xor2 0 xs

--fib takes a single number and returns a value
--n must be at least 1 or return 0 otherwise
fib :: (Eq a, Num a, Ord a) => a -> a
fib n
  | n < 1     = 0
  | otherwise = fibhelper n 0 1

--here's the fib helper I used...
--It takes 3 numbers and returns a single number
fibhelper :: (Num a, Eq a) => a -> a -> a -> a
fibhelper 1 _ curr = curr
fibhelper n prev curr = fibhelper (n - 1) curr (prev + curr)

