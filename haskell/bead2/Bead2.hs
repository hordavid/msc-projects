import Text.Pandoc
import Text.Pandoc.Definition
import Text.Pandoc.Builder
import Text.Pandoc.Walk as Walk
import Text.Pandoc.JSON
import qualified Data.Text.IO as Text
import Control.Monad.State
import Data.Monoid
import Data.Char
import Data.String
import Data.List


main :: IO ()
-- main = toJSONFilter a
-- main = toJSONFilter b
-- main = toJSONFilter c
main = toJSONFilter d


-- A
a :: Pandoc -> Pandoc
a p = walk f p
  where 
    f :: Block -> Block
    f (Header i a is) = Header (i+1) a is 
    f b = b

-- B 
b :: Pandoc -> Pandoc
b (Pandoc m bs) = walk f (Pandoc m bs)
  where 
    f :: Block -> Block
    f (Header i a is) = Header (i+(getMeta m "liftheader")) a is 
    f b = b

-- C
c :: Pandoc -> Pandoc
c (Pandoc m b) = Pandoc m bs
  where
    bs :: [Block]
    bs = do
      let lh = getMeta m "liftheader"
      let mh = getMeta m "maxheader"
      let result = runState (walkM cf b) ((lh, mh), True)
      case (snd (snd result)) of
        True -> fst result
        False -> [(Para [Str (fromString "Hiba történt.")])]

cf :: Block -> State ((Int,Int),Bool) Block
cf (Header i attr is) = do
  ((j, max), err) <- get
  put ((j, max), (err && ((i + j) < max)))
  return $ Header (i+j) attr is
cf b = return b

-- D
d :: Pandoc -> Pandoc
d (Pandoc meta b) = Pandoc meta bs
  where
    bs :: [Block]
    bs = evalState (walkM df b) ([0,0,0,0,0,0,0,0,0,0,0,0], 0)

df :: Block -> State ([Int], Int) Block
df (Header i attr []) = return $ Header i attr []
df (Header i attr (x:xs)) = do
   (olvls, olvl) <- get

   let nlvl = case i == olvl of
                True -> replace (i - 1) ((olvls!!(i-1)) + 1) olvls
                False -> reset i (replace (i - 1) ((olvls!!(i-1)) + 1) olvls)
   put $ (nlvl, i)
   return $ Header i attr ([(evalState (walkM f x) nlvl)] ++ xs)
       where
           f :: Inline -> State [Int] Inline
           f (Str str) = do
               nlvl <- get
               return $ Str (parse nlvl i)
           f x = return x
df b = return b

reset n arr = (take n arr) ++ replicate ((length arr) - n) 0

replace n nv (x:xs)
    | n == 0 = nv:xs
    | otherwise = x:replace (n-1) nv xs

parse :: [Int] -> Int -> [Char]
parse lvls lvl = (intercalate "." (map show (take lvl lvls))) ++ "."

getMeta :: Meta -> String -> Int
getMeta meta key = case lookupMeta key meta of
  Just (MetaString s) -> read s
  _                   -> case key of
                          "liftheader" -> 0
                          "maxheader"  -> 15
