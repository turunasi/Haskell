data Unti = Count Int
          | Volume Int
          | Sound String
          deriving Show
unti (Count 1) = "1 UNKO"
unti (Volume 1) = "!!"
unti (Sound "BURI") = "BURIBURIBURI" 
unti _ = "DENAKATTA" 