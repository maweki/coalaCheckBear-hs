module Main where

import Coala
import Coala.Input.SingleFile
import qualified Data.Text as T

needle = T.pack "Coala"
msg = "Did you mean 'coala'?"

check :: SingleFile -> [Result]
check input = do (no, line) <- zip [1..] $ file input
                 (pre, post) <- T.breakOnAll needle line
                 let ofs = T.length pre
                 return $ Result msg [codeRefLine (filename input) (Line no) (Just $ Column ofs) (+ 6)] (Severity 1)

main = coala "coalaCheckBear" singleFile check
