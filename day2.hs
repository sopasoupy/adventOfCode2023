module Main where
import Data.Maybe (listToMaybe)
import Data.List (findIndex)

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

stringsToIndexedTubles :: [String] -> [GameString]
stringsToIndexedTubles strings = zip [1..] strings

numBeforeElemInList :: [String] -> String -> Maybe String
numBeforeElemInList strings string = 
    case findIndex (== string) strings of 
        Just index -> if index > 0
            then Just (strings !! (index -1))
            else Nothing
        Nothing -> Nothing