module Main where

import Java

data Extent = Extent @geotrellis.vector.Extent deriving (Class, Show)

foreign import java unsafe "@static geotrellis.vector.Extent.fromString"
  extentFromString :: String -> Extent

foreign import java unsafe "geotrellis.vector.Extent.combine"
  combineExtents :: Extent -> Extent -> Extent

foreign import java unsafe "geotrellis.vector.Extent.width"
  extentWidth :: Extent -> Double

main :: IO ()
main = do
  ext1 <- return $ extentFromString "0,0,1,1"
  ext2 <- return $ extentFromString "1,1,2,2"
  print . show $ extentWidth ext1
