module Main where

import Coala
import Coala.Input.SingleFile
import qualified Data.Text as T

check :: SingleFile -> [Result]
check input = do (no, line) <- zip [1..] $ file input
                 (pre, post) <- T.breakOnAll (T.pack "Coala") line
                 return $ Result Normal "Did you mean 'coala'?" [codeRefInLine (filename input) (Line no) (Just $ Column $ T.length pre) (+ 6)]

main = coala "coalaCheckBear" singleFile check
