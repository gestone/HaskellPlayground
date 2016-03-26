module InterviewQuestions ()

where

import Data.List

singleVowel :: Maybe String -> Bool
singleVowel Nothing = False
singleVowel (Just s) = length (nub $ filter (`elem` "aeiouyAEIOUY") s) == 1

singleVowelFaster :: Maybe String -> Bool
singleVowelFaster Nothing = False
singleVowelFaster (Just s) = singleVowelHelper s Nothing

singleVowelHelper :: String -> Maybe Char -> Bool
singleVowelHelper [] Nothing = False
singleVowelHelper [] _ = True
singleVowelHelper (x:xs) Nothing = if x `elem` "aeiouyAEIOUY"
  then singleVowelHelper xs (Just x)
  else singleVowelHelper xs Nothing
singleVowelHelper (x:xs) (Just c) = (x == c || notElem x "aeiouyAEIOUY") &&
  singleVowelHelper xs (Just c)
