{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}
module Main where

import Data.Extensible
import Data.Proxy
import Data.Text
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import Servant.API

type Message = Record
    '[ "type" >: Text
     , "msg"  >: Text
     ]

getMessage :: Servant.Handler Message
getMessage = pure $ #type @= "text" <: #msg @= "nyaaaan" <: nil

type Api = Get '[JSON] Message

server :: Server Api
server = getMessage

app :: Application
app = serve (Proxy @ Api) server

main :: IO ()
main = do
    let settings = setPort 8080 defaultSettings
    runSettings settings app
