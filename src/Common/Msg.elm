module Common.Msg exposing (Msg(..))

import Browser exposing (UrlRequest)
import Url exposing (Url)


type Msg
    = UrlChange Url
    | ClickedLink UrlRequest
    | NoOp
    | CorrectAnswer
    | WrongAnswer
    | ResetTest
