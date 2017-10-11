module Mastermind

import StdEnv, StdLib

positionalMatches :: [Int] [Int] -> Int
positionalMatches xs ys = length [(x,y) \\ x <- xs & y <- ys | x==y]

matches :: [Int] [Int] -> Int
matches a b = 0

readCode :: String -> Maybe [Int]
readCode str = parsedListValidator [digitToInt c \\ c <- fromString str | isDigit c]
where
	parsedListValidator :: [Int] -> Maybe [Int]
	parsedListValidator xs
	| length xs == 4 = Just xs
	| otherwise = Nothing

maybe :: (a -> b) b (Maybe a) -> b
maybe f b x = b

allMatches :: [Int] String -> (Int, Int)
allMatches a b = (0,0)

//Start = positionalMatches [4,2,7,1] [1,2,3,4]
Start = readCode "1922"
