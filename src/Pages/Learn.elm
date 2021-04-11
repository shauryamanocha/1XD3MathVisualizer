module Pages.Learn exposing (..)

import Common.Msg exposing (Msg)
import Html exposing (..)
import Html.Attributes exposing (..)


learn1 : List (Html Msg)
learn1 =
    [ div [ class "main" ]
        [ div [ class "container" ]
            [ h1 [] [ text "What is a polynomial?" ]
            , p [] [ text "Polynomials look like this:" ]
            , img [ src "https://www.mathsisfun.com/algebra/images/polynomial-example.svg", class "flex-center", id "poly-image" ] []
            , h3 [] [ text "In simple terms, a polynomial is a sum of terms, where each term has a constant, a variable, and an exponent" ]
            , img [ src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.gq6Mv8iFi2BnN9Yq2fBLJwHaDD%26pid%3DApi&f=1", class "flex-center", id "poly-image" ] []
            , h4 [] [ text "Polynomials can have..." ]
            , ul []
                [ li [] [ p [] [ text "Constants like 3,-20,1/2" ] ]
                , li [] [ p [] [ text "Variables like x,y" ] ]
                , li [] [ p [] [ text "Exponents like 2 in y^2, except they must be positive, whole numbers (aka natural numbers)" ] ]
                ]
            , p [] [ text "Each 'term' can be combined using addition, subtraction, multiplication and division" ]
            , h3 [] [ text "**Except**" ]
            , p [] [ text "Division by a variable is *not* allowed (e.g. 2/x is not allowed as it is equivalent to 2x^-1)" ]
            , a [ href "/#learn/2", class "arrow" ] [ img [ class "arrow", src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmaxcdn.icons8.com%2FShare%2Ficon%2Fp1em%2FArrows%2Flong_arrow_right1600.png&f=1&nofb=1" ] [] ]
            ]
        ]
    ]


learn2 : List (Html Msg)
learn2 =
    [ div [ class "main" ]
        [ div [ class "container" ]
            [ h1 [] [ text "Now lets try transforming a function!" ]
            , h3 [] [ text "In this case, we'll use f(x) = x^2 for simplicity" ]
            , h3 [] [ text "There are lots of ways we can modify how this function looks" ]
            , iframe [ class "flex-center desmos", src "https://www.desmos.com/calculator/7tssz9keqn?embed" ] []
            , h4 [] [ text "Pay attention to the key points that have been pointed out here, so we can see how they change" ]
            , a [ href "/#learn/3", class "arrow" ] [ img [ class "arrow", src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmaxcdn.icons8.com%2FShare%2Ficon%2Fp1em%2FArrows%2Flong_arrow_right1600.png&f=1&nofb=1" ] [] ]
            ]
        ]
    ]


learn3 : List (Html Msg)
learn3 =
    [ div [ class "main" ]
        [ div [ class "container" ]
            [ h1 [] [ text "Vertical Shift:" ]
            , h4 [] [ text "We can move the function up or down by adding a constant value to our function" ]
            , h4 [] [ text "Positive values will shift the graph up, negative values will shift it down" ]
            , h4 [] [ text "f(x) = x^2 + C (in this case, 'C' is the shift value)" ]
            , iframe [ class "flex-center desmos", src "https://www.desmos.com/calculator/pqgwjcf03d" ] []
            , a [ href "/#learn/4", class "arrow" ] [ img [ class "arrow", src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmaxcdn.icons8.com%2FShare%2Ficon%2Fp1em%2FArrows%2Flong_arrow_right1600.png&f=1&nofb=1" ] [] ]
            ]
        ]
    ]


learn4 : List (Html Msg)
learn4 =
    [ div [ class "main" ]
        [ div [ class "container" ]
            [ h1 [] [ text "Horizontal Shift:" ]
            , h4 [] [ text "We can move the function left or right by adding a constant value to 'x' (before any constant or exponent)" ]
            , h4 [] [ text "f(x) = (x+C)^2 (in this case, 'C' is the shift value)" ]
            , iframe [ class "flex-center desmos", src "https://www.desmos.com/calculator/csysqbvbt1" ] []
            , h4 [] [ text "Positive values will shift the graph LEFT, negative values will shift it to the RIGHT, this is unintuitive so its important to remember!" ]
            , a [ href "/#learn/5", class "arrow" ] [ img [ class "arrow", src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmaxcdn.icons8.com%2FShare%2Ficon%2Fp1em%2FArrows%2Flong_arrow_right1600.png&f=1&nofb=1" ] [] ]
            ]
        ]
    ]


learn5 : List (Html Msg)
learn5 =
    [ div [ class "main" ]
        [ div [ class "container" ]
            [ h1 [] [ text "Vertical Stretch:" ]
            , h4 [] [ text "For both horizontal and vertical stretch we'll be looking at a different function to make it easier to see" ]
            , h4 [] [ text "We can make the function taller or shorter by multiplying the whole thing by a constant" ]
            , h4 [] [ text "f(x) = C*sin(x) (in this case, 'C' is the stretch value), dont worry, you won't be tested on the sin function" ]
            , iframe [ class "flex-center desmos", src "https://www.desmos.com/calculator/hw25cqkh2n" ] []
            , h4 [] [ text "Notice how a greater value will stretch the function out taller, and smaller values will make it shorter" ]
            , h4 [] [ text "Also keep in mind that a NEGATIVE value flips, or, REFLECTS the entire function, this is called a vertical reflection" ]
            , a [ href "/#learn/6", class "arrow" ] [ img [ class "arrow", src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmaxcdn.icons8.com%2FShare%2Ficon%2Fp1em%2FArrows%2Flong_arrow_right1600.png&f=1&nofb=1" ] [] ]
            ]
        ]
    ]


learn6 : List (Html Msg)
learn6 =
    [ div [ class "main" ]
        [ div [ class "container" ]
            [ h1 [] [ text "Horizontal Stretch:" ]
            , h4 [] [ text "We can make the function wider or skinner by multiplying just the X value, before anything else" ]
            , h4 [] [ text "f(x) = sin(C*x) (in this case, 'C' is the stretch value), dont worry, you won't be tested on the sin function" ]
            , iframe [ class "flex-center desmos", src "https://www.desmos.com/calculator/knvmzkcfkp" ] []
            , h4 [] [ text "Notice how a greater value will make the function skinnier, and smaller values will make it wider" ]
            , h4 [] [ text "Just like with horizontal/vertical shifts, the horizontal can be counter-intuitive, so pay attention to what values make the function wider and skinner!" ]
            , h4 [] [ text "Also keep in mind that a NEGATIVE value flips, or, REFLECTS the entire function, this is called a horizontal reflection" ]
            , a [ href "/#learn/7", class "arrow" ] [ img [ class "arrow", src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmaxcdn.icons8.com%2FShare%2Ficon%2Fp1em%2FArrows%2Flong_arrow_right1600.png&f=1&nofb=1" ] [] ]
            ]
        ]
    ]


learn7 : List (Html Msg)
learn7 =
    [ div [ class "main" ]
        [ div [ class "container" ]
            [ h1 [] [ text "Lets put it all together!" ]
            , h4 [] [ text "You may have noticed that theres a lot of transformations, and it can be hard to know how to apply them all, especially with more complicated functions" ]
            , h4 [] [ text "Luckily, theres a concise way to apply these transformations, for ANY function!" ]
            , h2 [] [ text "af(b(x-h))+k, where f(x) is ANY function" ]
            , h3 [] [ text "In the case of a quadratic, it looks like this: a(b(h-h))^2+k" ]
            , iframe [ class "flex-center desmos", src "https://www.desmos.com/calculator/y6hkbzs2y0" ] []
            , h4 [] [ text "Try playing around with the values to see how they affect the function, maybe even change the base function, f(x), and see how it looks with different functions!" ]
            , h4 [] [ text "If you mess something up, or just want to reset the graph, refresh the page" ]
            , a [ href "/#test", class "arrow" ] [ img [ class "arrow", src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmaxcdn.icons8.com%2FShare%2Ficon%2Fp1em%2FArrows%2Flong_arrow_right1600.png&f=1&nofb=1" ] [] ]
            ]
        ]
    ]
