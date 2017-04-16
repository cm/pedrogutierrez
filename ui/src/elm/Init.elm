module Init exposing (..)

import Models exposing (..)
import Messages exposing (..)
import Commands exposing (..)
import Material


model : Flags -> Model
model flags =
    { flags = flags
    , count = 0
    , mdl = Material.model
    , selectedTab = 0
    , resume = Nothing
    , state = Normal
    , error = Nothing
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( model flags
    , [ fetchResume flags
      ]
        |> Cmd.batch
    )
