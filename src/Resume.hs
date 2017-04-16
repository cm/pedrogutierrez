{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}

module Resume where

import           GHC.Generics
import qualified Data.Text as T
import           Data.Aeson (ToJSON)
import           SocialLink
import           Project 
import           Contact
import           Role
import           Language
import           Skill

data Resume = Resume
  { headline  :: T.Text
  , subtitle  :: T.Text
  , contact   :: Contact
  , summary   :: T.Text
  , projects  :: [Project]
  , social    :: [SocialLink]
  , roles     :: [Role]
  , languages :: [Language]
  , skills    :: [Skill]
  } deriving (Show,Generic)

instance ToJSON Resume
