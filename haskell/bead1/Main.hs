module Main where

import Text.Pandoc
import Text.Pandoc.Definition
import Text.Pandoc.Walk as Walk
import qualified Data.Text as Text
import qualified Data.Text.IO as TextIO
import Control.Monad.State
import Data.Monoid


main :: IO ()
main = do
  text <- TextIO.readFile "in_files/example.md"
  md <- runIOorExplode $ readMarkdown (def {readerExtensions = pandocExtensions}) text
  genStat md
  mda <- runIOorExplode $ writeMarkdown (def {writerExtensions = pandocExtensions}) (lineNumA md)
  mdb <- runIOorExplode $ writeMarkdown (def {writerExtensions = pandocExtensions}) (lineNumB md)
  TextIO.writeFile "out_files/a.out.md" mda
  TextIO.writeFile "out_files/b.out.md" mdb

{-|
  A feladat:
  Pandoc markdown formátumú dokumentumban beszámozza a kód blokkok sorait.
  A számozás minden kód blokkban 1-től indul.
-}
lineNumA :: Pandoc -> Pandoc
lineNumA p = walk f p
  where
    f :: Block -> Block
    f (CodeBlock attr str) = CodeBlock attr (processStr str 1)
    f b = b

{-|
  B feladat:
  Pandoc markdown formátumú dokumentumban beszámozza a kód blokkok sorait.
  Az egymás utáni kód blokkokban folytatódik a számozás.
-}
lineNumB :: Pandoc -> Pandoc
lineNumB p = evalState (Walk.walkM f p) 1
  where 
    f :: Block -> State Int Block
    f (CodeBlock attr str) = do
        i <- get
        put (i + length (lines str))
        return $ CodeBlock attr (processStr str i)
    f b = return b

{-|
  Statisztika elkészítése és kiírása a konzolra.
-}
genStat :: Pandoc -> IO ()
genStat p = do
  let blockSums = runState (sumBlocks p) (0, 0)
  let strSums = runState (sumStrs p) (0, 0)

  putStrLn $ show (fst (snd blockSums)) ++ " code blocks"
  putStrLn $ show (snd (snd blockSums)) ++ " code lines"
  putStrLn $ show (fst (snd strSums)) ++ " words (without code)"
  putStrLn $ show (snd (snd strSums)) ++ " characters (without code)"    

{-|
  Egy kód sorokat reprezentáló Stringet alakít át Stringek tömbjévé.
  Majd a tömb elemeit egyenként feldolgozva megkapjuk az Int paraméter értékétől kezdve a
  sorszámokkal ellátott kód sorok tömbjét.
  Az eredmény az új tömb String reprezentációja.
-}
processStr :: String -> Int -> String
processStr str i = unlines (evalState (mapM processLine (lines str)) i)

{-|
  Egy kód sort reprezentáló Stringet fűz össze egy sorszámmal.
-}
processLine :: String -> State Int String
processLine str = do
  i <- get
  put (i + 1)
  pure $ show i ++ "   " ++ str

{-|
  C és D feladat:
  Megadja egy (Int, Int) pár segítségével, hogy hány kód blokk és hány kód sor van egy Pandoc dokumentumban.
-}
sumBlocks :: Pandoc -> State (Int, Int) Pandoc
sumBlocks p = Walk.walkM f p
  where
        f :: Block -> State (Int, Int) Block
        f (CodeBlock attr str) = do
            (block, line) <- get
            put ((block + 1), (line + (length $ lines str)))
            return $ CodeBlock attr str
        f b = return b

{-|
  E, F és G feladat:
  Megadja egy (Int, Int) pár segítségével,
  hogy hány szó (az Str elemeket számolja a Pandoc adatszerkezetében) 
  és hány karakter (az Str elemek karaktereit számolja a Pandoc adatszerkezetében) 
  volt egy Pandoc dokumentumban.
-}
sumStrs :: Pandoc -> State (Int, Int) Pandoc
sumStrs p = Walk.walkM f p
  where
        f :: Inline -> State (Int, Int) Inline
        f (Str str) = do
            (s, ch) <- get
            put ((s + 1), (ch + (length str)))
            return $ Str str
        f i = return i
