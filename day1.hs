module Main where
import Data.Char (digitToInt)

main :: IO ()
main = do
    let filePath = "puzzles/Day1.txt"
    input <- readLines filePath
    let output = sumList (map combineDigits (map putFirstAndLastInt input))
    putStrLn (show output)

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


putFirstAndLastInt :: String -> [Int]
putFirstAndLastInt xs = case filter (`elem` digits) xs of
    []  -> []
    [x] -> [digitToInt x, digitToInt x]
    ys  -> [digitToInt (head ys), digitToInt (last ys)]


combineDigits :: [Int] -> Int 
combineDigits = foldl (\acc x -> acc * 10 + x) 0


sumList :: [Int] -> Int
sumList xs = sum xs