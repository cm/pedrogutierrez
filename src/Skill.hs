{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}

module Skill where

import           GHC.Generics
import qualified Data.Text as T
import           Data.Aeson (ToJSON)

data Skill = Skill
  { name        :: T.Text
  , level       :: T.Text
  } deriving (Show, Generic)

instance ToJSON Skill 
