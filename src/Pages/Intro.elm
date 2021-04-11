module Pages.Intro exposing (..)

import Common.Msg exposing (Msg)
import Html exposing (..)
import Html.Attributes exposing (..)


body : List (Html Msg)
body =
    [ div [ class "main" ]
        [ div [ class "container" ]
            [ p [] [ text "Here is a quadratic function, try dragging the sliders to see how each value effects the function" ]
            , iframe [ class "desmos", src "https://www.desmos.com/calculator/v2mnyx6otx" ] []
            , p [] [ text "Notice how the 'h' value changes horizontal shift (slides left and right)" ]
            , p [] [ text "Notice how the 'k' value changes vertical shift (slides up and down)" ]
            , p [] [ text "Notice how the 'a' value changes vertical stretch/compression (makes it taller or shorter)" ]
            , a [ href "/#learn/1", class "arrow" ] [ img [ class "arrow", src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmaxcdn.icons8.com%2FShare%2Ficon%2Fp1em%2FArrows%2Flong_arrow_right1600.png&f=1&nofb=1" ] [] ]
            ]
        ]
    ]
