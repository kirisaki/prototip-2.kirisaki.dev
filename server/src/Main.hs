{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}
module Main where

import Data.Extensible
import Data.Proxy
import Data.Text
import Lucid
import Lucid.Servant
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import Servant.API
import Servant.HTML.Lucid

type Message = Record
    '[ "type" >: Text
     , "msg"  >: Text
     ]

getMessage :: Servant.Handler Message
getMessage = pure $ #type @= "text" <: #msg @= "nyan" <: nil

htmlTemplate :: Text -> Servant.Handler (Html ())
htmlTemplate t = pure $ do
    doctype_ 
    html_ $ do
        head_ $ do
            meta_ [charset_ "utf-8"]
            title_ [] (pure t)
        body_ $ do
            div_ [id_ "app"] mempty
            script_ [src_ "/main.js"] empty 


type Api = "api" :> Get '[JSON] Message
        :<|> "about" :> Get '[HTML] (Html ())
        :<|> "dashboard" :> Get '[HTML] (Html ())
        :<|> Get '[HTML] (Html ())
        :<|> Raw

server :: Server Api
server = getMessage 
    :<|> htmlTemplate "prototip-2"
    :<|> htmlTemplate "prototip-2 - about"
    :<|> htmlTemplate "prototip-2 - dashboard"
    :<|> serveDirectoryWebApp "/js"

app :: Application
app = serve (Proxy @ Api) server

main :: IO ()
main = do
    let settings = setPort 8080 defaultSettings
    runSettings settings app
