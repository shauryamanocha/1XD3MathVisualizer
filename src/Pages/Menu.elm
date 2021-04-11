module Pages.Menu exposing (..)

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Browser
import Common.Msg exposing (Msg)
import Html exposing (Html, a, button, div, h1, h2, h3, p, text)
import Html.Attributes exposing (..)


body : List (Html Msg)
body =
    [ div [ id "menuContainer" ]
        [ h1 []
            [ text "Transformation Trainer"
            ]
        , a [ href "/#intro" ]
            [ button []
                [ h2 [] [ text "Introduction" ]
                ]
            ]
        , a [ href "/#learn/1" ]
            [ button []
                [ h2 [] [ text "Learn" ]
                ]
            ]
        , a [ href "/#test" ]
            [ button []
                [ h2 [] [ text "Test Yourself" ]
                ]
            ]
        ]
    ]


page : Browser.Document Msg
page =
    { title = "Transformation Trainer"
    , body = body
    }


subscriptions : model -> Sub Msg
subscriptions model =
    Sub.none
