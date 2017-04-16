module Views exposing (..)

import Models exposing (..)
import Messages exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Material
import Material.Layout as Layout
import Material.Color as Color
import Material.Scheme
import Material.Card as Card
import Material.List as MdList
import Material.Button as Button
import Material.Options exposing (onClick, css, styled)
import Material.Typography as Typo


view : Model -> Html Msg
view model =
    case model.state of
        Error ->
            case model.error of
                Nothing ->
                    errorView "Unknown error"

                Just e ->
                    errorView e

        Normal ->
            case model.resume of
                Nothing ->
                    errorView "No resume!"

                Just resume ->
                    resumeView resume model


errorView : String -> Html Msg
errorView message =
    div []
        [ h1 []
            [ text "Error"
            ]
        , p []
            [ text message
            ]
        ]


resumeView : Resume -> Model -> Html Msg
resumeView resume model =
    Material.Scheme.topWithScheme Color.Teal Color.LightGreen <|
        Layout.render Mdl
            model.mdl
            [ Layout.fixedHeader
            , Layout.selectedTab model.selectedTab
            , Layout.onSelectTab SelectTab
            ]
            { header = [ header resume ]
            , drawer = []
            , tabs =
                ( [ text "About"
                  , text "Projects"
                  , text "Resume"
                  ]
                , [ Color.background (Color.color Color.Teal Color.S400) ]
                )
            , main = [ viewBody resume model ]
            }


header : Resume -> Html Msg
header resume =
    styled div
        [ css "padding" "2rem" ]
        [ styled p
            [ Typo.display1 ]
            [ text resume.headline ]
        , styled p
            [ Typo.title, Typo.uppercase ]
            [ text resume.subtitle ]
        ]


viewBody : Resume -> Model -> Html Msg
viewBody resume model =
    case model.selectedTab of
        0 ->
            aboutView resume model

        1 ->
            projectsView resume model

        2 ->
            resumeDownloadView model

        _ ->
            text "404"


aboutView : Resume -> Model -> Html Msg
aboutView resume model =
    styled div
        [ css "padding" "2rem" ]
        ((summaryView resume)
            ++ (contactView resume)
            ++ (List.map (socialLink model) resume.social)
        )


summaryView : Resume -> List (Html Msg)
summaryView resume =
    [ styled p
        [ Typo.display1 ]
        [ text "Summary" ]
    , styled p
        [ Typo.subhead ]
        [ text resume.summary ]
    ]


contactView : Resume -> List (Html Msg)
contactView resume =
    [ styled p
        [ Typo.display1 ]
        [ text "Contact" ]
    , MdList.ul []
        [ MdList.li []
            [ MdList.content []
                [ MdList.icon "email" []
                , text resume.contact.email
                ]
            ]
        , MdList.li []
            [ MdList.content []
                [ MdList.icon "phone" []
                , text resume.contact.phone
                ]
            ]
        ]
    ]


socialLink : Model -> Social -> Html Msg
socialLink model social =
    styled span
        [ css "margin-right" "5px" ]
        [ Button.render Mdl
            [ 9, 0, 0, 1 ]
            model.mdl
            [ Button.ripple
            , Button.colored
            , Button.raised
            , Button.link social.url
            ]
            [ text social.name ]
        ]


projectsView : Resume -> Model -> Html Msg
projectsView resume model =
    styled div
        [ css "padding" "2rem"
        ]
        (List.map (projectView model) resume.projects)


projectView : Model -> Project -> Html Msg
projectView model project =
    styled p
        [ css "margin-bottom" "20px" ]
        [ styled p
            [ Typo.display1 ]
            [ text project.name ]
        , styled p
            [ Typo.subhead ]
            [ text project.description ]
        , styled p
            [ Typo.button ]
            [ text project.technologies ]
        , styled p
            []
            [ Button.render Mdl
                [ 9, 0, 0, 1 ]
                model.mdl
                [ Button.ripple
                , Button.colored
                , Button.raised
                , Button.link project.demo
                , css "margin-right" "5px"
                ]
                [ text "Live demo" ]
            , Button.render Mdl
                [ 9, 0, 0, 1 ]
                model.mdl
                [ Button.ripple
                , Button.colored
                , Button.raised
                , Button.link project.code
                ]
                [ text "Code" ]
            ]
        ]


resumeDownloadView : Model -> Html Msg
resumeDownloadView model =
    styled p
        [ css "padding" "2rem" ]
        [ styled p
            [ Typo.display1 ]
            [ text "PDF Resume" ]
        , styled p
            []
            [ Button.render Mdl
                [ 9, 0, 0, 1 ]
                model.mdl
                [ Button.ripple
                , Button.colored
                , Button.raised
                , Button.link "/pedrogutierrez.pdf"
                ]
                [ text "View resume" ]
            ]
        ]
