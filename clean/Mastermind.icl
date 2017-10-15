module Mastermind

import StdEnv, StdLib

positionalMatches :: [Int] [Int] -> Int
positionalMatches xs ys = length [(x,y) \\ x <- xs & y <- ys | x==y]

matches :: [Int] [Int] -> [(Int,Int)]
matches a b = [(x,y) \\ x <- normalize a, y <- b | x==y]
where
	normalize :: [Int] -> [Int]
	normalize [x:xs] = [x \\ y <- xs | x<>y]

readCode :: String -> Maybe [Int]
readCode str = validator [digitToInt c \\ c <- fromString str | isDigit c]
where
	validator :: [Int] -> Maybe [Int]
	validator xs
	| length xs == 4 = Just xs
	| otherwise = Nothing

maybe :: (a -> b) b (Maybe a) -> b
maybe f b Nothing = b
maybe f b (Just x) = f x

allMatches :: [Int] String -> (Int, Int)
allMatches a b = (0,0)

Start = positionalMatches [6,6,6,1] [6,6,5,1]
