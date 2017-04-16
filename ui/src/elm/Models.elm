module Models exposing (..)

import Material


type alias Flags =
    { api : String }


type alias Resume =
    { headline : String
    , subtitle : String
    , summary : String
    , contact : Contact
    , social : List Social
    , projects : List Project
    , roles : List Role
    , skills : List Skill
    }


type alias Contact =
    { email : String
    , phone : String
    }


type alias Social =
    { name : String
    , url : String
    }


type alias Project =
    { name : String
    , description : String
    , demo : String
    , code : String
    , technologies : String
    }


type alias Role =
    { employer : String
    , industry : String
    , description : String
    , location : String
    }


type alias Skill =
    { name : String
    , level : String
    }


type State
    = Normal
    | Error


type alias Model =
    { flags : Flags
    , count : Int
    , mdl : Material.Model
    , selectedTab : Int
    , resume : Maybe Resume
    , state : State
    , error : Maybe String
    }


type alias Mdl =
    Material.Model
