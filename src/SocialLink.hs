{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}

module SocialLink where

import           GHC.Generics
import qualified Data.Text as T
import           Data.Aeson (ToJSON)

data SocialLink = SocialLink
  { name :: T.Text
  , url  :: T.Text
  } deriving (Show, Generic)

instance ToJSON SocialLink
