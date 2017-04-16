module Main exposing (..)

import Rest exposing (get, post, put, delete)
import Models exposing (..)
import Messages exposing (..)
import Urls exposing (..)
import Decoders exposing (..)
import Init exposing (..)
import Commands exposing (..)
import Update exposing (..)
import Views exposing (..)
import Html exposing (..)


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , subscriptions = always Sub.none
        , update = update
        }
