module Main exposing (..)

import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)


-- Subscriptions


subs : Model -> Sub Msg
subs model =
    Sub.none



-- Main


main : Program Never
main =
    Html.App.program
        { init = ( {}, Cmd.none )
        , update = update
        , view = view
        , subscriptions = subs
        }



-- Model


type alias Model =
    {}



-- Messages


type Msg
    = NoOp



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "Animated Alert" ]
        , button
            [ class "btn btn-primary"
            ]
            [ text "Show Alert" ]
        , h1 [] [ text "Model" ]
        , p [] [ text (toString model) ]
        , div
            [ class "alert alert-danger"
            ]
            [ text ""
            ]
        ]
