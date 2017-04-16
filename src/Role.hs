{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}

module Role where

import           GHC.Generics
import qualified Data.Text as T
import           Data.Aeson (ToJSON)

data Role = Role
  { description :: T.Text
  , employer    :: T.Text
  , start       :: T.Text
  , end         :: T.Text
  , location    :: T.Text
  , industry    :: T.Text
  } deriving (Show, Generic)

instance ToJSON Role
