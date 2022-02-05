module MainMaybe exposing (main)

import Browser
import Html exposing (Html, Attribute, span, input, text, div)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
  Browser.sandbox { init = init, update = update, view = view }

type alias Model =
  { inputC : String
  , inputF : String
  }


init : Model
init =
  { inputC = "" , inputF = ""}

type Msg
  = ChangeC String | ChangeF String


update : Msg -> Model -> Model
update msg model =
  case msg of
    ChangeC newInput ->
      { model | inputC = newInput }
    ChangeF newInput ->
      { model | inputF = newInput }

view : Model -> Html Msg
view model = 
  div []
    [ viewC model
    , div [] []
    , viewF model
    ]

viewF : Model -> Html Msg
viewF model = viewHelper model.inputF ChangeF toCelsius "F°=" "°C"

viewC : Model -> Html Msg
viewC model = viewHelper model.inputC ChangeC toFarenheit "C°=" "°F"

toCelsius : Float -> Float
toCelsius f = ((f - 32) / 1.8)

toFarenheit : Float -> Float
toFarenheit c = 32 +  c * 1.8

viewHelper : String -> (String -> Msg) -> (Float -> Float) -> String -> String -> Html Msg
viewHelper input change f inputTag outputTag= 
 case String.toFloat input of
    Just temp ->
      viewConverter input "blue" (String.fromFloat (f temp)) True change inputTag outputTag

    Nothing ->
      viewConverter input "red" "INVALID INPUT" False change inputTag outputTag


viewConverter : String -> String -> String -> Bool -> (String -> Msg) -> String-> String-> Html Msg
viewConverter userInput color equivalentTemp isValidInput change inputTag outputTag =
  span []
    [ text "User Input: "
    , input [ value userInput, onInput change, (if isValidInput then style "width" "40px" else style "background-color" color )] []
    , text inputTag
    , span [ style "color" color ] [ text equivalentTemp ]
    , text outputTag
    ]

