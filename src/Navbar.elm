module Navbar exposing (navbar)

import Bootstrap.Navbar as Navbar
import Html exposing (Html, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (href)
import Types exposing (Msg(..))


navbar : Navbar.State -> Html Msg
navbar state =
    Navbar.config NavbarMsg
        |> Navbar.withAnimation
        |> Navbar.brand [ href "#" ] [ text "Brand" ]
        |> Navbar.items
            [ Navbar.itemLink [ onClick <| Scroll "calender" ] [ text "Events" ]
            , Navbar.itemLink [ onClick <| Scroll "contact" ] [ text "Contact" ]
            , Navbar.itemLink [ href "#" ] [ text "History" ]
            , Navbar.itemLink [ href "#" ] [ text "Challenges" ]
            , Navbar.itemLink [ href "Talks" ] [ text "Club How To" ]
            ]
        |> Navbar.view state
