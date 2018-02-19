module Trie

import StdEnv, StdLib, GenEq

derive gEq Trie, Maybe

:: Trie v = T (Maybe v) [(Char, Trie v)]

emptyTrie :: Trie v
emptyTrie = T Nothing []

insertTrie :: String v (Trie v) -> (Trie v)
insertTrie s v t = InsTrie [c \\ c <-: s] v t
where
	InsTrie :: [Char] v (Trie v) -> (Trie v)
	InsTrie [] v (T _ t) = T (Just v) t
	InsTrie [x:xs] v (T maybe []) = T maybe [(x, InsTrie xs v emptyTrie)]
	InsTrie [x:xs] v (T maybe [(val, t):ys])
		| val == x = T maybe [(x, InsTrie xs v t):ys]
		| x < val = T maybe [(x, InsTrie xs v t), (val, t):ys]
				  = T maybe ([(val, t)] ++ [(x, InsTrie xs v (T maybe ys))])

buildTrie :: [(String, v)] -> Trie v
buildTrie xs = foldr op emptyTrie xs
where
	op (s, v) t = insertTrie s v t

lookupTrie :: String (Trie v) -> Maybe v
lookupTrie s t = lt [c \\ c <-: s] t
where
	lt :: [Char] (Trie v) -> Maybe v
	lt [] (T maybe _) = maybe
	lt [x:xs] (T maybe []) = Nothing
	lt [x:xs] (T maybe [(v, t):ys])
    	| x == v = lt xs t
             = lt [x:xs] (T maybe ys)

class Functor f where
  fmap :: (a -> b) (f a) -> (f b)

instance Functor Trie where
  	fmap :: (a -> b) (Trie a) -> (Trie b)
    fmap _ (T Nothing []) = T Nothing []
    fmap f (T (Just a) []) = T (Just (f a)) []
    fmap f (T (Just a) xs) = T (Just (f a)) (map (\(c, t) = (c, fmap f t)) xs)
    fmap f (T Nothing xs) = T Nothing (map (\(c, t) = (c, fmap f t)) xs)

// *** TESTS ***
test_insertTrie :: [Bool]
test_insertTrie =
    [ insertTrie ""    0 emptyTrie
	=== T (Just 0) []
    , insertTrie "a"   1 emptyTrie
	=== T Nothing [('a', T (Just 1) [])]

    , insertTrie "b"   2 (insertTrie "a"   1 emptyTrie)
	=== T Nothing [('a', T (Just 1) []), ('b', T (Just 2) [])]
    , insertTrie "a"   1 (insertTrie "b"   2 emptyTrie)
	=== T Nothing [('a', T (Just 1) []), ('b', T (Just 2) [])]

    , insertTrie "ab"  3 (insertTrie "a"   1 emptyTrie)
	=== T Nothing [('a', T (Just 1) [('b', T (Just 3) [])])]
    , insertTrie "abc" 4 emptyTrie
	=== T Nothing [('a', T Nothing [('b', T Nothing [('c', T (Just 4) [])])])]
    ]

test_buildTrie :: [Bool]
test_buildTrie =
    [ buildTrie [] === emptyTrieInt
    , buildTrie [("", 0)] === T (Just 0) []
    , buildTrie [("", 0), ("ab", 1), ("abc", 2), ("abd", 3)] ===
	T (Just 0) [('a', T Nothing [('b', T (Just 1) [('c', T (Just 2) []), ('d', T (Just 3) [])])])]
    ]
    where
	emptyTrieInt :: Trie Int
	emptyTrieInt = emptyTrie  

test_lookupTrie =
    [ lookupTrie "hello" emptyTrieBool == Nothing
    , lookupTrie ""    t == Just 0
    , lookupTrie "a"   t == Nothing
    , lookupTrie "ab"  t == Just 1
    , lookupTrie "abc" t == Just 2
    , lookupTrie "abd" t == Just 3
    , lookupTrie "abe" t == Nothing
    ]
    where
	emptyTrieBool :: Trie Bool
	emptyTrieBool = emptyTrie
	t :: Trie Int
	t = T (Just 0) [('a', T Nothing [('b', T (Just 1) [('c', T (Just 2) []), ('d', T (Just 3) [])])])]
  
test_fmap :: [Bool]
test_fmap =
    [ fmap ((+) 1) emptyTrie === emptyTrie
    , fmap ((+) 1) (T (Just 0) []) === (T (Just 1) [])
    , fmap ((+) 1) (T (Just 0) [('a', T Nothing [('b', T (Just 1) [('c', T (Just 2) []), ('d', T (Just 3) [])])])])
            === T (Just 1) [('a', T Nothing [('b', T (Just 2) [('c', T (Just 3) []), ('d', T (Just 4) [])])])]
    , fmap (\x -> if (x rem 2 == 0) "even" "odd") (T (Just 0) [('a', T Nothing [('b', T (Just 1) [('c', T (Just 2) []), ('d', T (Just 3) [])])])])
            === (T (Just "even") [('a', T Nothing [('b', T (Just "odd") [('c', T (Just "even") []), ('d', T (Just "odd") [])])])])
    ]
  
Start = (and (flatten tests), tests)
where
	tests =
      [ test_insertTrie
      , test_buildTrie
      , test_lookupTrie
      , test_fmap
      ]