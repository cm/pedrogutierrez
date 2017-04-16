{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}

module Contact where

import           GHC.Generics
import qualified Data.Text as T
import           Data.Aeson (ToJSON)

data Contact = Contact
  { email :: T.Text 
  , phone :: T.Text
  } deriving (Show,Generic)

instance ToJSON Contact
