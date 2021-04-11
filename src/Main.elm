module Main exposing (..)

import Bootstrap.CDN as CDN
import Browser
import Browser.Dom as Dom
import Browser.Navigation as Navigation exposing (Key)
import Common.Msg exposing (..)
import Html exposing (..)
import Pages.DisplayScore
import Pages.Intro
import Pages.Learn
import Pages.Menu
import Pages.Tests
import Task
import Url exposing (Url)
import Url.Parser as UrlParser exposing ((</>), Parser, s, top)


type alias Flags =
    {}


type alias Model =
    { navKey : Key
    , page : Page
    , debug : String
    , testIndex : Int
    , score : Int
    }


type Page
    = Menu
    | Intro
    | Learn Int
    | Test


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = UrlChange
        }


init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags url key =
    let
        ( model, urlCmd ) =
            urlUpdate url { navKey = key, page = Menu, debug = "", testIndex = 0, score = 0 }
    in
    ( model, Cmd.batch [ urlCmd ] )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Pages.Menu.subscriptions model
        ]


resetViewport : Cmd Msg
resetViewport =
    Task.perform (\_ -> NoOp) (Dom.setViewport 0 0)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedLink req ->
            case req of
                Browser.Internal url ->
                    ( { model | debug = Url.toString url }, Navigation.pushUrl model.navKey <| Url.toString url )

                Browser.External href ->
                    ( model, Navigation.load href )

        UrlChange url ->
            urlUpdate url model

        CorrectAnswer ->
            ( { model | score = model.score + 1, testIndex = model.testIndex + 1 }, Cmd.none )

        WrongAnswer ->
            ( { model | testIndex = model.testIndex + 1 }, Cmd.none )

        ResetTest ->
            ( { model | testIndex = 0, score = 0 }, Cmd.none )

        _ ->
            ( model, Cmd.none )


urlUpdate : Url -> Model -> ( Model, Cmd Msg )
urlUpdate url model =
    case decode url of
        Nothing ->
            ( { model | page = Menu }, resetViewport )

        Just route ->
            ( { model | page = route, debug = Debug.toString route }, resetViewport )


decode : Url -> Maybe Page
decode url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> UrlParser.parse routeParser


routeParser : Parser (Page -> a) a
routeParser =
    UrlParser.oneOf
        [ UrlParser.map Menu top
        , UrlParser.map Learn (UrlParser.s "learn" </> UrlParser.int)
        , UrlParser.map Intro (UrlParser.s "intro")
        , UrlParser.map Test (UrlParser.s "test")
        ]


view : Model -> Browser.Document Msg
view model =
    case model.page of
        Menu ->
            Pages.Menu.page

        Learn i ->
            { title = "Learn About Transformations!"
            , body =
                case i of
                    1 ->
                        Pages.Learn.learn1

                    2 ->
                        Pages.Learn.learn2

                    3 ->
                        Pages.Learn.learn3

                    4 ->
                        Pages.Learn.learn4

                    5 ->
                        Pages.Learn.learn5

                    6 ->
                        Pages.Learn.learn6

                    7 ->
                        Pages.Learn.learn7

                    _ ->
                        []
            }

        Intro ->
            { title = "Transformation Trainer"
            , body = Pages.Intro.body
            }

        Test ->
            { title = "Test your skills!"
            , body =
                if model.testIndex == List.length Pages.Tests.tests then
                    Pages.DisplayScore.body model.score model.testIndex

                else
                    Pages.Tests.body model.testIndex model.score
            }


addInlineStyle : Browser.Document Msg -> Model -> Browser.Document Msg
addInlineStyle page model =
    { title = page.title, body = CDN.stylesheet :: page.body ++ [ text model.debug ] }
