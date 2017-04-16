{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Applicative
import           Snap.Core
import           Snap.Util.FileServe
import           Snap.Http.Server
import           Data(resume)
import           Data.Aeson (encode)

main :: IO ()
main = quickHttpServe site

site :: Snap ()
site =
    route [ ("", serveDirectory "./public")
          , ("api/resume", resumeHandler)
          ] <|> notFoundHandler 



notFoundHandler :: Snap ()
notFoundHandler = do
    modifyResponse $ setHeader "Content-Type" "application/json"
    modifyResponse $ setResponseStatus 404 "Not Found"

resumeHandler :: Snap ()
resumeHandler = do
    modifyResponse $ setHeader "Content-Type" "application/json"
    modifyResponse $ setHeader "Access-Control-Allow-Origin" "*"
    modifyResponse $ setHeader "Access-Control-Request-Method" "GET"
    writeLBS . encode $ resume
