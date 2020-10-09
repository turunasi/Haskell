# 代数的データ型
- 列挙型(enum)
- 直積型(struct)
- 直和型(union)
## 列挙型(enum)
コンストラクタをそのまま有限集合にするデータ型.
型もコンストラクタも大文字で始めなければならない.
操作には型クラス(デフォルトで6種類)を定義しなければ使えない.
```haskell
data Color = Blue | Red | Green | White
```
### Show
列挙型->文字型
```haskell
data Color = Blue | Red | Green | White deriving Show
```
### Enum 
列挙型 <-> 数値
```haskell
data Color = Blue | Red | Green | White deriving Enum
fromEnum Blue -- 0
toEnum 0 :: Color -- Blue
```
### Bool
デフォルトで定義されている真偽値の列挙型
```haskell
data Bool = False | True deriving (Eq, Ord, Enum, Read, Show, Bounded)
```
- Eq      : == /= で比較可能になる.
- Ord     : < > で比較可能になる.
- Read    : 文字列から変換可能になる.
- Bounded : 最小値と最大値を持つようになる.
## 直積型(struct)
ある二つの集合の各元の組み合わせを元として持つ集合
```haskell
data Point = Point Int Int deriving Show
offset (Point x1 y1) (Point x2 y2) =
    Point (x1 + x2) (y1 + y2)
```
### newtype
フィールドを1つしか持たない直積型
```haskell
newtype Foo = Foo Int
```
## 直和型(union)
直積型の和集合
```haskell
data Test = TestInt Int
          | TestStr String
          deriving Show

foo (TestInt  1 ) = "bar"
foo (TestStr "1") = "baz"
foo _             = "?"

foo $ TestInt 1 -- "bar"
foo $ TestInt 2 -- "?"
foo $ TestStr "1" -- "baz"
foo $ TestStr "2" -- "?"
```
### リスト
実はリスト型は直和型として定義されている.
```haskell
data [a] = [] | a:[a]
```
ここで,aは型変数と呼ばれ,任意の型を許容する変数.
### 型シノニム
synonym : 同意語・別名
文字列は文字のリストとして定義されている.
```haskell
type String = [Char]
```
# レコード構文
直積型や直和型のデータ型のフィールドに対して命名をすることができる.
```haskell
data Foo = Foo { bar :: Int, baz :: String }
Foo { bar=1, baz="a"} -- Foo { bar=1, baz="a"}
Foo 2 "b" -- Foo { bar=2, baz="b"}
```
## フィールドの参照
フィールド名がそのままフィールドを参照する関数になる.
```haskell
let f = Foo { bar=1, baz="a"}
print f -- Foo { bar=1, baz="a"}
print (bar f, baz f) -- (1,"a") フィールド名関数
let (Foo a b) = f
print (a,b) -- (1,"a")
let (Foo { bar=c }) = f
print c -- 1
```