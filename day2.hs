module Main where

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

