module Main where 

import Crypt.All 
import Data.Char
type Command = (String, String, Int)


extractPlaintext :: String -> String
extractPlaintext command = case start of
    ('"' : rest) -> takeWhile (/= '"') rest  -- first char is " extract text until next "
    _            -> ""  -- Otherwise, return empty
  where start = dropWhile (/= '"') command  -- Skip everything before first `"`

extractTextAndN :: [String] -> (String, Int)
extractTextAndN wrds = let text = extractPlaintext(unwords wrds)
                           n = last wrds
                        in if all isDigit n
                            then (text, read n :: Int) 
                            else ("", 0) 

processCommand :: String -> Command
processCommand input = case words input of 
                        (cmd : rest) -> case extractTextAndN rest of
                                       (text, nr) -> (cmd, text, nr) 
                        _   -> ("","",0)

handleCommand:: Command -> String
handleCommand (cmd, input, n)
    | cmd == "ceaserEncrypt" = ceaserEncrypt input n
    | cmd == "ceaserDecrypt" = ceaserDecrypt input n
    | otherwise              = "Unknown command"


askPrompt = do
            putStrLn "Format: <command> \"<text>\" <n>  Commands are : ceaserEncrypt, ceaserDecrypt"
            putStrLn "Type 'quit' to exit"
            input <- getLine
            if input == "quit"
                then putStrLn "Quitting.."
                else do
                    let command = processCommand input
                    putStr("\n")
                    putStrLn (handleCommand command)  
                    putStr("\n")
                    askPrompt
            


main = 
    do
        askPrompt