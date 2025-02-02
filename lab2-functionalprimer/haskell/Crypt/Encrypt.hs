module Crypt.Encrypt where
import Data.Char 

shiftRight :: Char -> Int -> Char 
shiftRight c n | isAlpha c =chr(((ascii + n - base) `mod` 26) + base)
               | otherwise  = c
    where 
        base | isUpper c = ord 'A' 
             | otherwise = ord 'a'
        ascii = ord c


ceaserEncrypt :: [Char] -> Int -> [Char]
ceaserEncrypt "" _ = []
ceaserEncrypt (h : rest) n = shiftRight h n : ceaserEncrypt rest n