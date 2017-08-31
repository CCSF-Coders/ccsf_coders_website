module Main exposing (main)

import Html exposing (Html, text, div, h1, h2, p, iframe, i, a)
import Html.Attributes exposing (href, attribute, class, id)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Row as Row
import Bootstrap.Grid.Col as Col
import Bootstrap.Navbar as Navbar
import Bootstrap.Card as Card
import Bootstrap.Table as Table
import Scroll exposing (scroll)
import Types exposing (..)
import Navbar exposing (navbar)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    let
        ( navbarState, navbarCmd ) =
            Navbar.initialState NavbarMsg
    in
        Model navbarState ! [ navbarCmd ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NavbarMsg state ->
            ( { model | navbarState = state }, Cmd.none )

        Scroll id ->
            ( model, scroll id )


view : Model -> Html Msg
view model =
    Grid.container []
        [ CDN.stylesheet
        , Grid.row [ Row.centerMd ]
            [ Grid.col [] [ navbar model.navbarState ]
            ]
        , Grid.row [ Row.rightXs ]
            [ Grid.col [ Col.xs3 ] [ meetingTimes ]
            ]
        , Grid.row []
            [ Grid.col [] [ welcome ]
            ]
        , Grid.row []
            [ Grid.col [] [ upcomingEvents ]
            ]
        , Grid.row [ Row.centerMd ]
            [ Grid.col [ Col.md10 ] [ contact ]
            ]
        , Grid.row [ Row.centerMd ]
            [ Grid.col [ Col.md8 ] [ groupLink ] ]
        ]


meetingTimes : Html Msg
meetingTimes =
    Card.config []
        |> Card.block []
            [ Card.titleH4 [] [ text "Spring Meeting Times" ]
            , Card.text [] [ text "Wendsdays, 4-6 PM Batmale Hall, Rm 451" ]
            ]
        |> Card.view


welcome : Html Msg
welcome =
    div []
        [ h1 [] [ text "Welcome" ]
        , p [] [ text """
            You've found the door to the furthest reaches of human existence. Beyond which there is even more beyondness. We are the coders of CCSF. If you are interested in technology, coding, learning, advice or homework help, coders is the place for you! If not CCSF Coders club might be the place for you anyway. For example do you like the internet? DO you want to build more internet? WE CAN HELP! CCSF coders is a group of students of varying degrees of skill but all with an interest in computer science who meet up every week to work on project, discuss computer science, and complain about their classes. To join literally all you have to do is show up to our meetings, we dislike red tape, and hierarchical structures. At coders club we actively attempt to include and provide safe space for women, POC, and LGBT community members.
        """ ]
        ]


groupLink : Html Msg
groupLink =
    div []
        [ text "The best way to get in contact with the group is to join our "
        , a [ href "https://groups.google.com/forum/#!forum/ccsfcoders" ] [ text "Google Group!" ]
        ]


upcomingEvents : Html Msg
upcomingEvents =
    div []
        [ h2 [] [ text "Upcoming Events" ]
        , p [] [ text "Check back here when the semester starts for our calendar" ]
        , iframe [ id "calender", attribute "src" "https://www.google.com/calendar/embed?src=coders%40mail.ccsf.edu&ctz=America/Los_Angeles" ] []
        ]


icon : String -> Html Msg
icon name =
    i [ class <| "fa fa-" ++ name ] []


socialIcon : String -> String -> Html Msg
socialIcon name link =
    a [ href link, class "social-icon" ] [ icon name ]


contact : Html Msg
contact =
    div [ id "contact" ]
        [ Grid.container []
            [ Grid.row [ Row.centerMd ]
                [ Grid.col [ Col.md3 ]
                    [ h2 [] [ text "Get In Touch" ]
                    , socialIcon "github-sqare" "https://github.com/CCSF-Coders"
                    , socialIcon "facebook-square" "https://www.facebook.com/groups/CCSFCoders/"
                    , socialIcon "youtube-square" "https://www.youtube.com/user/CCSFCoders"
                    , socialIcon "google" "https://groups.google.com/forum/#!forum/ccsfcoders"
                    , socialIcon "twitter-square" "https://twitter.com/ccsfcoders"
                    , socialIcon "slack" "https://ccsfcodersclub.slack.com/"
                    ]
                ]
            ]
        , Table.simpleTable
            ( Table.simpleThead
                [ Table.th [] [ text "Position" ]
                , Table.th [] [ text "Name" ]
                , Table.th [] [ text "Email" ]
                ]
            , Table.tbody []
                [ Table.tr []
                    [ Table.td [] [ text "President" ]
                    , Table.td [] [ text "Ryan Lim" ]
                    , Table.td [] [ text "coders@mail.ccsf.edu" ]
                    ]
                , Table.tr []
                    [ Table.td [] [ text "Advisor" ]
                    , Table.td [] [ text "Craig Persiko" ]
                    , Table.td [] [ text "craig.persiko@mail.ccsf.edu" ]
                    ]
                , Table.tr []
                    [ Table.td [] [ text "Treasurer" ]
                    , Table.td [] [ text "Bakulia Kurmant" ]
                    , Table.td [] []
                    ]
                , Table.tr []
                    [ Table.td [] [ text "ICC Rep" ]
                    , Table.td [] [ text "Jack Cole" ]
                    , Table.td [] [ text "jcole@gmail.com" ]
                    ]
                ]
            )
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Navbar.subscriptions model.navbarState NavbarMsg
