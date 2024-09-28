module Lib
    ( someFunc,
    putIntsInStringIntoList,
    sumList
    ) where
import Data.Char (digitToInt)
someFunc :: IO ()
someFunc = putStrLn "someFunc"


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

    

