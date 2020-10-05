# 代数的データ型
- 列挙型(enum)
- 直積型(struct)
- 直和型(union)
## 列挙型(enum)
コンストラクタをそのまま有限集合にするデータ型.
型もコンストラクタも大文字で始めなければならない.
操作には型クラス(デフォルトで6種類)を定義しなければ使えない.
```
data Color = Blue | Red | Green | White
```
### Show
列挙型->文字型
```
data Color = Blue | Red | Green | White deriving Show
```
### Enum 
列挙型 <-> 数値
```
data Color = Blue | Red | Green | White deriving Enum
fromEnum Blue (0)
toEnum 0 :: Color (Blue)
```
### Bool
デフォルトで定義されている真偽値の列挙型
```
data Bool = False | True deriving (Eq, Ord, Enum, Read, Show, Bounded)
```
- Eq      : == /= で比較可能になる.
- Ord     : < > で比較可能になる.
- Read    : 文字列から変換可能になる.
- Bounded : 最小値と最大値を持つようになる.
## 直積型(struct)
ある二つの集合の各元の組み合わせを元として持つ集合
```
data Point = Point Int Int deriving Show
offset (Point x1 y1) (Point x2 y2) =
    Point (x1 + x2) (y1 + y2)
```
### newtype
フィールドを1つしか持たない直積型
```
newtype Foo = Foo Int
```
## 直和型(union)