module Types exposing (..)

import Bootstrap.Navbar as Navbar


type alias Model =
    { navbarState : Navbar.State }


type Msg
    = NavbarMsg Navbar.State
    | Scroll String
