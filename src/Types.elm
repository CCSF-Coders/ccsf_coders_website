module Types exposing (..)

import Bootstrap.Navbar as Navbar
import Router exposing (Route)


type alias Model =
    { navbarState : Navbar.State
    , route : Maybe Route
    }


type Msg
    = NavbarMsg Navbar.State
    | Scroll String
    | RouteChange (Maybe Route)
