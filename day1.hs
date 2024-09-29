module Main where
import Data.Char (digitToInt)

main :: IO ()
main = someFunc

someFunc :: IO ()
someFunc = do
    putStrLn "lmao"

readLines :: FilePath -> IO [String]
readLines filePath = do
    contents <- readFile filePath
    return (lines contents)


type Alphabet = [Char]

digits :: Alphabet
digits = ['0' .. '9']

putIntsInStringIntoList :: String -> [Int]
putIntsInStringIntoList [] = []
putIntsInStringIntoList (x : xs) = 
    if x `elem` digits 
    then (digitToInt x) : putIntsInStringIntoList xs 
    else putIntsInStringIntoList xs

sumList :: [Int] -> Int
sumList xs = sum xs