module Decoders exposing (..)

import Json.Decode as Decode exposing (Decoder)
import Models exposing (..)


resumeDecoder : Decode.Decoder Resume
resumeDecoder =
    Decode.map8 Resume
        (Decode.field "headline" Decode.string)
        (Decode.field "subtitle" Decode.string)
        (Decode.field "summary" Decode.string)
        (Decode.field "contact" contactDecoder)
        (Decode.field "social" socialDecoder)
        (Decode.field "projects" projectsDecoder)
        (Decode.field "roles" rolesDecoder)
        (Decode.field "skills" skillsDecoder)


contactDecoder : Decode.Decoder Contact
contactDecoder =
    Decode.map2 Contact
        (Decode.field "email" Decode.string)
        (Decode.field "phone" Decode.string)


socialDecoder : Decode.Decoder (List Social)
socialDecoder =
    Decode.list socialLinkDecoder


socialLinkDecoder : Decode.Decoder Social
socialLinkDecoder =
    Decode.map2 Social
        (Decode.field "name" Decode.string)
        (Decode.field "url" Decode.string)


projectsDecoder : Decode.Decoder (List Project)
projectsDecoder =
    Decode.list projectDecoder


projectDecoder =
    Decode.map5 Project
        (Decode.field "name" Decode.string)
        (Decode.field "description" Decode.string)
        (Decode.field "demo" Decode.string)
        (Decode.field "code" Decode.string)
        (Decode.field "technologies" Decode.string)


rolesDecoder : Decode.Decoder (List Role)
rolesDecoder =
    Decode.list roleDecoder


roleDecoder =
    Decode.map4 Role
        (Decode.field "employer" Decode.string)
        (Decode.field "industry" Decode.string)
        (Decode.field "description" Decode.string)
        (Decode.field "location" Decode.string)


skillsDecoder : Decode.Decoder (List Skill)
skillsDecoder =
    Decode.list skillDecoder


skillDecoder =
    Decode.map2 Skill
        (Decode.field "name" Decode.string)
        (Decode.field "level" Decode.string)
