module Main exposing (..)

import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Task
import Process


-- Subscriptions


subs : Model -> Sub Msg
subs model =
    Sub.none



-- Main


main : Program Never
main =
    Html.App.program
        { init =
            ( { beginShow = False
              , show = False
              , beginHide = False
              }
            , Cmd.none
            )
        , update = update
        , view = view
        , subscriptions = subs
        }



-- Model


type alias Model =
    { beginShow : Bool
    , show : Bool
    , beginHide : Bool
    }



-- Messages


type Msg
    = BeginShow
    | BeginHide
    | Hide
    | Show
    | NoOp



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        BeginShow ->
            ( { model | beginShow = True, show = True }
            , Task.perform (always NoOp) (always Show) (Process.sleep 1000)
            )

        BeginHide ->
            ( { model | beginHide = True }
            , Task.perform (always NoOp) (always Hide) (Process.sleep 1000)
            )

        Show ->
            ( { model | show = True, beginShow = False }
            , Task.perform (always NoOp) (always BeginHide) (Process.sleep 1000)
            )

        Hide ->
            ( { model | show = False, beginHide = False }
            , Cmd.none
            )

        NoOp ->
            ( model, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "Animated Alert" ]
        , button
            [ class "btn btn-primary"
            , onClick BeginShow
            ]
            [ text "Show Alert" ]
        , h1 [] [ text "Model" ]
        , p [] [ text (toString model) ]
        , if model.show then
            div
                [ classList
                    [ ( "alert", True )
                    , ( "alert-danger", True )
                    , ( "alert-danger", True )
                    , ( "animated", True )
                    , ( "fadeInDown", model.beginShow )
                    , ( "fadeOutDown", model.beginHide )
                    ]
                ]
                [ text "Oh no! Dinosaurs!" ]
          else
            span [] []
        ]
