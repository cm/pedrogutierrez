module Messages exposing (..)

import Models exposing (..)
import Material
import Http exposing (Error)


type Msg
    = Increase
    | Reset
    | Mdl (Material.Msg Msg)
    | SelectTab Int
    | ResumeFetched (Result Error Resume)
