module Crypt.Decrypt (ceaserDecrypt) where
import Data.Char 

shiftLeft :: Char -> Int -> Char 
shiftLeft c n | isAlpha c =chr(((ascii - n - base) `mod` 26) + base)
               | otherwise  = c
    where 
        base | isUpper c = ord 'A' 
             | otherwise = ord 'a'
        ascii = ord c


ceaserDecrypt :: [Char] -> Int -> [Char]
ceaserDecrypt "" _ = []
ceaserDecrypt (h : rest) n = shiftLeft h n : ceaserDecrypt rest n