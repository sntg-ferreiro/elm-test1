module MainText exposing (..)
import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
  Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { content : String
    }


init : Model
init =
  { content = "" }


type Msg = Change String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }



view : Model -> Html Msg
view model =
  let 
    length : String
    length = 
      model.content
        |> String.length
        |> String.fromInt
  in
  div []
    [ input [ placeholder "Text to reverse", value model.content, onInput Change ] []
    , div [] [ text ("Reversed: " ++ String.reverse model.content) ]
    , div [] [ text ("Length: " ++ length) ]
    ]