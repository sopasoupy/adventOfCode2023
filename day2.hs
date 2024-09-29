module Main where
import Data.Char (isDigit)
main :: IO ()
main = someFunc

someFunc :: IO()
someFunc = putStrLn "LMAO"

readLines :: FilePath -> IO [String]
readLines filePath = do
    contents <- readFile filePath
    return (lines contents)

type CubeCounts = String -> Int
type GameString = (Int, String)
type Game = (Int, CubeCounts)

validCubeCounts :: CubeCounts
validCubeCounts "red" = 12
validCubeCounts "green" = 13
validCubeCounts "blue" = 14
validCubeCounts _ = undefined


checkCubeCounts :: CubeCounts -> CubeCounts -> Bool
checkCubeCounts countsSample countsValid = 
    countsSample "blue" <= countsValid "blue" &&
    countsSample "red" <= countsValid "red" &&
    countsSample "green" <= countsValid "green"

stringsToIndexedTubles :: [String] -> [GameString]
stringsToIndexedTubles strings = zip [1..] strings

isColor :: String -> Bool
isColor str = str `elem` ["red", "green", "blue"]

readInts :: String -> Int
readInts = read


parseColorCounts :: String -> [(String, Int)]
parseColorCounts s =
    let wordsList = words s
        pairedList = zip (filter isColor wordsList) (map readInts (filter (all isDigit) wordsList))
    in pairedList

wordsWhen :: (Char -> Bool) -> String -> [String]
wordsWhen p s =  case dropWhile p s of
                      "" -> []
                      s' -> w : wordsWhen p s''
                            where (w, s'') = break p s'
