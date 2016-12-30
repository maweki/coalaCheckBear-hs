module Main where

import Coala
import qualified Coala.Input.SingleFile as Input
import qualified Data.Text as T

check :: Input.SingleFile -> [Result]
check input = do (no, line) <- zip [1..] $ Input.file input
                 (pre, post) <- T.breakOnAll (T.pack "Coala") line
                 return $ Result Normal "Did you mean 'coala'?" [codeRefInLine (Input.filename input) (Line no) (Just $ Column $ T.length pre) (+ 6)]

main = coala "coalaCheckBear" Input.singleFile check
