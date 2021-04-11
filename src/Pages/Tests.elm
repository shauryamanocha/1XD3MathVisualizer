module Pages.Tests exposing (..)

import Array
import Common.Msg exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


body : Int -> Int -> List (Html Msg)
body idx score =
    let
        test =
            Array.get idx (Array.fromList tests)
    in
    [ div [ class "main" ]
        [ div [ class "container" ]
            [ div [ id "testHeaderContainer" ]
                [ h1 [] [ text "Now its time to test your skills!" ]
                , h1 [] [ text ("Score: " ++ String.fromInt score ++ "/" ++ String.fromInt idx) ]
                ]
            , div [ class "optionContainer" ]
                (case test of
                    Just t ->
                        h4 [] [ text t.title ]
                            :: iframe [ src t.desmosSrc, class "desmos" ] []
                            :: List.map
                                (\( option, correct ) ->
                                    button
                                        [ onClick
                                            (if correct then
                                                CorrectAnswer

                                             else
                                                WrongAnswer
                                            )
                                        ]
                                        [ h3 [] option ]
                                )
                                t.options

                    Nothing ->
                        []
                )
            ]
        ]
    ]


type alias IdentifyTest =
    { title : String, desmosSrc : String, options : List ( List (Html Msg), Bool ) }


tests : List IdentifyTest
tests =
    [ { title = "Identify the correct equation for this function (use the points to help you out)"
      , desmosSrc = "https://www.desmos.com/calculator/gnwhomjzuf?embed"
      , options =
            [ ( [ text "y=3x", sup [] [ text "2" ], text "+5" ], False )
            , ( [ text "y=x", sup [] [ text "3" ], text "+5" ], False )
            , ( [ text "y=3x", sup [] [ text "3" ] ], False )
            , ( [ text "y=3x", sup [] [ text "3" ], text "+5" ], True )
            ]
      }
    , { title = "Identify the correct equation for this function (use the points to help you out)"
      , desmosSrc = "https://www.desmos.com/calculator/wc8g0mmtoa?embed"
      , options =
            [ ( [ text "y=x", sup [] [ text "2" ], text "+2" ], False )
            , ( [ text "y=x", sup [] [ text "2" ], text "-2" ], False )
            , ( [ text "y=(x-2)", sup [] [ text "2" ], text "-2" ], True )
            , ( [ text "y=(x+2)", sup [] [ text "2" ], text "-2" ], False )
            ]
      }
    , { title = "Identify the correct equation for this function (use the points to help you out)"
      , desmosSrc = "https://www.desmos.com/calculator/qritz0xqqb?embed"
      , options =
            [ ( [ text "y=(x+3)", sup [] [ text "2" ], text "+7" ], False )
            , ( [ text "y=-(x+3)", sup [] [ text "2" ], text "+7" ], True )
            , ( [ text "y=-(x-3)", sup [] [ text "2" ], text "+7" ], False )
            , ( [ text "y=(x+3)", sup [] [ text "2" ], text "+7" ], False )
            ]
      }
    , { title = "Identify the correct equation for this function (use the points to help you out)"
      , desmosSrc = "https://www.desmos.com/calculator/7ptvrepzag?embed"
      , options =
            [ ( [ text "y=(2(x+3))", sup [] [ text "3" ], text "+2" ], False )
            , ( [ text "y=(x-3)", sup [] [ text "2" ], text "-2" ], False )
            , ( [ text "y=(2x+3)", sup [] [ text "2" ], text "+2" ], False )
            , ( [ text "y=(2(x+3))", sup [] [ text "2" ], text "+2" ], True )
            ]
      }
    ]
