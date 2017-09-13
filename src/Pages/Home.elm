module Pages.Home exposing (view)

import Types exposing (Model, Msg)
import Html exposing (Html, text, div, h1, h2, i, a, iframe, p)
import Html.Attributes exposing (href, id, attribute, class)
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Row as Row
import Bootstrap.Grid.Col as Col
import Bootstrap.Card as Card
import Bootstrap.Table as Table
import Components.Navbar exposing (navbar)


view : Model -> Html Msg
view model =
    Grid.container []
        [ Grid.row [ Row.centerMd ]
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
    Card.config [ Card.attrs [ id "meeting-times" ] ]
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


contactItem : String -> String -> String -> Table.Row Msg
contactItem position name email =
    Table.tr []
        [ Table.td [] [ text position ]
        , Table.td [] [ text name ]
        , Table.td [] [ text email ]
        ]


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
                [ contactItem "President" "Michael Leung" "mleung25@mail.ccsf.edu"
                , contactItem "Advisor" "Craig Persiko" "craig.persiko@mail.ccsf.edu"
                , contactItem "Treasurer" "Elias Lawson-Fox" "eliaslfox@gmail.com"
                , contactItem "ICC Rep" "Betty Zhang" "bzhang6@mail.ccsf.edu"
                ]
            )
        ]
