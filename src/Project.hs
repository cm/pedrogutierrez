{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}

module Project where

import           GHC.Generics
import qualified Data.Text as T
import           Data.Aeson (ToJSON)

data Project = Project
  { name  :: T.Text
  , description :: T.Text
  , demo :: T.Text
  , code :: T.Text
  , technologies :: T.Text
  } deriving (Show, Generic)

instance ToJSON Project
