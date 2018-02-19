module Mastermind

import StdEnv, StdLib

positionalMatches :: [Int] [Int] -> Int
positionalMatches xs ys = length [(x,y) \\ x <- xs & y <- ys | x==y]

matches :: [Int] [Int] -> Int
matches a b = checker (sort a) (sort b) 0
where
	checker :: [Int] [Int] Int -> Int
	checker xs ys cntr
		| isEmpty xs || isEmpty ys = cntr
		| hd xs == hd ys = checker (removeAt 0 xs) (removeAt 0 ys) (inc cntr)
		| hd xs < hd ys = checker (removeAt 0 xs) ys cntr
		| hd xs > hd ys = checker xs (removeAt 0 ys) cntr

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
allMatches a b = (matches a (maybe (sort) [] (readCode b)) - positionalMatches a (maybe (sort) [] (readCode b)), positionalMatches a (maybe (sort) [] (readCode b)))

Start = allMatches [9,3,0,5] "123a"
