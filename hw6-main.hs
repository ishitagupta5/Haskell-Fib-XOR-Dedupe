import Homework6
import System.Environment
import System.IO
import Data.List

main :: IO ()
main = do
        args <- getArgs
        if length args /= 2
          then do
                putStrLn "Usage: hw5-main <input.txt> <output.txt>"
                return ()
          else do
                let files = get_names args
                let input = fst files 
                let output = snd files
                --let input = "input.txt"
                --let output = "output.txt"
                --putStrLn input
                --putStrLn output
                in_handle <- openFile input ReadMode
                out_handle <- openFile output WriteMode
                mainloop in_handle out_handle
                hClose in_handle
                hClose out_handle


mainloop :: Handle -> Handle -> IO ()
mainloop in_handle out_handle = 
        do in_eof <- hIsEOF in_handle
           if in_eof
                then return ()
                else do line <- hGetLine in_handle
                        hPutStr out_handle line
                        let line_words = words line
                        --putStr "\tWords: "
                        --print line_words
                        parse_functions line_words out_handle
                        mainloop in_handle out_handle


get_names :: [String] -> (String, String)
get_names (arg1:arg2:_) = 
        let in_file = arg1
            out_file = arg2
        in (in_file, out_file)

parse_functions [] out = return ()

parse_functions ("remove_duplicates": xs) out = do
        let numbers = convert_list xs
        let  no_dupes = remove_duplicates numbers
        hPutStr out " is " 
        hPutStrLn out $ show no_dupes
        return ()
parse_functions ("xor" : xs ) out = do
        let numbers = convert_list xs
        let true_or_false  = xor numbers 
        hPutStr out " is "
        hPutStrLn out $ show true_or_false
        return ()
parse_functions ("fib" : num ) out = do
        let n = read $ head num
        let result = fib n
        hPutStr out " is "
        hPutStrLn out $ show result
        return ()
parse_functions ( command : xs ) out = do
        hPutStr out command
        --hPutStrLn out show xs
        return ()

--convert_list :: (Read a, Num b) => [a] -> [b]
convert_list [] = []
convert_list (x:xs ) = do
        let number = read x::Int
        number : convert_list xs

