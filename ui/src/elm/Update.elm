module Update exposing (..)

import Models exposing (..)
import Messages exposing (..)
import Material


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increase ->
            ( { model | count = model.count + 1 }
            , Cmd.none
            )

        Reset ->
            ( { model | count = 0 }
            , Cmd.none
            )

        SelectTab num ->
            { model | selectedTab = num } ! []

        Mdl msg2 ->
            Material.update Mdl msg2 model

        ResumeFetched (Err e) ->
            ( { model | state = Error, error = Just (toString e) }, Cmd.none )

        ResumeFetched (Ok r) ->
            ( { model | resume = Just r }, Cmd.none )
