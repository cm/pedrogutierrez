{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}

module Language where

import           GHC.Generics
import qualified Data.Text as T
import           Data.Aeson (ToJSON)

data Language = Language
  { name        :: T.Text
  , level       :: T.Text
  } deriving (Show, Generic)

instance ToJSON Language 
