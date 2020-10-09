data Rect  = Rect { x::Int, y::Int, w::Int, h::Int} deriving Show
data Point = Point { px::Int, py::Int} deriving Show

contains r p =
    ((x r) <= (px p) && (px p) <= (x r)+(x w)) && ((y r) <= (py p) && (py p) <= (y r)+(y h))