module Pages.DisplayScore exposing (..)

import Common.Msg exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


body : Int -> Int -> List (Html Msg)
body score num =
    [ div [ class "main" ]
        [ div [ class "container" ]
            [ h1 [] [ text ("Good Job! You got a score of: " ++ String.fromInt score ++ "/" ++ String.fromInt num) ]
            , a [ id "homeButton", href "/" ]
                [ button [ id "homeButton", onClick ResetTest ]
                    [ h2 [] [ text "Back Home" ]
                    ]
                ]
            ]
        ]
    ]
