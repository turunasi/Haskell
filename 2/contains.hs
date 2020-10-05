data Rect  = Rect Int Int Int Int deriving Show
data Point = Point Int Int deriving Show

contains (Rect x y w h) (Point px py) =
    (x <= px && px <= x+w) && (y <= py && py <= y+h)