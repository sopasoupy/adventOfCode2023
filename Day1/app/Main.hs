module Main (main) where

import Lib

main :: IO ()
main = someFunc

readLines :: FilePath -> IO [String]
readLines filePath = do
    contents <- readFile filePath
    return (lines contents)

