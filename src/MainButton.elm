module MainButton exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model = Int


init : Model
init =
  0



-- UPDATE


type Msg
  = Increment
  | Decrement
  | Reset
  | TenIncrement
  | TenDecrement


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
     model - 1

    Reset -> 0

    TenIncrement -> 
     model + 10
    
    TenDecrement -> 
     model - 10



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , button [ onClick TenDecrement ] [ text "-10" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick TenIncrement ] [ text "+10" ]
    , button [ onClick Reset ] [ text "Reset" ]
    ]