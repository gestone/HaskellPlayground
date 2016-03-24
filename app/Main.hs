module Main where

import Lib

main :: IO ()
main = do
   let solutions = [problemOne,
                    problemTwo,
                    problemThree,
                    problemFour,
                    -- problemFive,
                    -- problemSix,
                    -- problemSeven
                    problemEight,
                    problemNine,
                    -- problemTen,
                    problemEleven
                    ]
   mapM_ print solutions
