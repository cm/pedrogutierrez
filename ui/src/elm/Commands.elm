module Commands exposing (..)

import Models exposing (..)
import Messages exposing (..)
import Rest exposing (..)
import Decoders exposing (..)
import Urls exposing (..)


fetchResume : Flags -> Cmd Msg
fetchResume flags =
    get (resumeUrl flags) resumeDecoder ResumeFetched
