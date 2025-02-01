--create inpFunc
inpFunc :: Int -> Int -> [Int]
inpFunc a b = [a..b] 

--Define applicatorFunc

applicatorFunc inpFunc a b s | s=='s' = fromIntegral(sum (inpFunc a b)) 
                             | otherwise = (fromIntegral(sum(inpFunc a b)))/fromIntegral(b-a+1)  

main = do
    putStrLn "Enter a number"
    input <- getLine
    let nr = (read input :: Int)
    putStrLn "Enter a second number"
    input2 <- getLine
    let nr2 = (read input2 :: Int)
    let result = applicatorFunc inpFunc nr nr2 'a' --Call applicatorFunc with inpFunc and 'a' as args
    putStrLn("sum = " ++ show(result))