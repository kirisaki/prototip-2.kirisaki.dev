{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}
module Main where

import Data.CaseInsensitive
import Data.Extensible
import Data.Proxy
import Data.Text
import Lucid
import Lucid.Servant
import Network.Wai
import Network.Wai.Middleware.Gzip
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

htmlTemplate :: Text -> Html ()
htmlTemplate t = do
    doctype_ 
    html_ $ do
        head_ $ do
            meta_ [charset_ "utf-8"]
            title_ [] (pure t)
        body_ $ do
            div_ [id_ "app"] mempty
            script_ [src_ "/scripts/main.js"] empty 

notfound :: [Text] -> Servant.Handler NoContent
notfound _ = throwError $ err404 
    { errBody = renderBS (htmlTemplate "prototip-2 - notfound")
    , errHeaders = [(mk "Content-Type", "text/html; charset=utf-8")]
    }

type Api = "api" :> Get '[JSON] Message
        :<|> "about" :> Get '[HTML] (Html ())
        :<|> "dashboard" :> Get '[HTML] (Html ())
        :<|> Get '[HTML] (Html ())
        :<|> "scripts" :> Raw
        :<|> CaptureAll "path" Text :> Get '[JSON] NoContent

server :: Server Api
server = getMessage 
    :<|> pure (htmlTemplate "prototip-2")
    :<|> pure (htmlTemplate "prototip-2 - about")
    :<|> pure (htmlTemplate "prototip-2 - dashboard")
    :<|> serveDirectoryWebApp "/js"
    :<|> notfound 

app :: Application
app = gzip def { gzipFiles = GzipCompress  } $ serve (Proxy @ Api) server

main :: IO ()
main = do
    let settings = setPort 8080 defaultSettings
    runSettings settings app
