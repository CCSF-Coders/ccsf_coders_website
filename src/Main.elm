module Main exposing (main)

import Html exposing (Html, text, div, h1, h2, p, iframe, i, a)
import Types exposing (..)
import Router exposing (Route(..), parseRoute)
import Pages.Home
import Navigation exposing (Location)
import Ports exposing (scroll)
import Bootstrap.Navbar as Navbar
import Bootstrap.CDN as CDN


-- MAIN
-- This wires the whole program together


main : Program Never Model Msg
main =
    Navigation.program
        (\location -> RouteChange <| parseRoute location)
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- INIT
-- This generate the state of the application when it first loads


init : Location -> ( Model, Cmd Msg )
init location =
    let
        ( navbarState, navbarCmd ) =
            Navbar.initialState NavbarMsg
    in
        ( Model navbarState (parseRoute location), navbarCmd )



-- UPDATE
-- This calculates the newstate after each message


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NavbarMsg state ->
            ( { model | navbarState = state }, Cmd.none )

        Scroll id ->
            ( model, scroll id )

        RouteChange route ->
            ( { model | route = route }, Cmd.none )



-- VIEW
-- This generate the entire view


view : Model -> Html Msg
view model =
    div []
        [ CDN.stylesheet -- this inserts a script tag for bootstrap
        , renderPage model
        ]



-- renderPage
-- This renders the correct view for the current route


renderPage : Model -> Html Msg
renderPage model =
    case model.route of
        Just Home ->
            Pages.Home.view model

        Nothing ->
            Debug.crash "Invalid Page"



-- SUBSCRIPTIONS
-- This allows listen to events


subscriptions : Model -> Sub Msg
subscriptions model =
    Navbar.subscriptions model.navbarState NavbarMsg
