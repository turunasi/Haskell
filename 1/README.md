# 命名規則
小文字から始めなければならない.
再定義は許されない.
```haskell
A = 1
F x = x + 1
```
# 関数の定義
## 一番シンプルな場合
```haskell
main = print "Hello, world"
```
```haskell
f x = x + 1
```
shell scriptのように他の言語のように括弧で囲む必要はない.
## 複数回出力
```haskell
main = do
    print "Hello,"
    print "world"
```
```haskell
Hello,
world
```
## 関数の値の参照
値を参照するときは,次の3つの場合が存在する.
### 一度変数を定義する場合
```haskell
a = f 1
```
### 括弧で囲う場合
```haskell
(f 1)
```
### $を使う場合
```haskell
$ f 1
```
## 関数<==>演算子
### 関数==>演算子
`で関数を囲むことで演算子化できる.
```haskell
1 `add` 2
```
### 関数<==演算子
括弧で演算子を囲むことで関数化できる.
```haskell
(+) 1 2
```
# 変数の定義
## トップレベル変数(グローバル変数)
```haskell
a = 1
b = 2
c = a + b
main = do
    print c
```
## ローカル変数
### where
使用箇所の真下で定義.
```haskell
main = do
    print c
    where
        a = 1
        b = 2
        c = a + b
```
### let
使用前に定義
#### doあり
```haskell
main = do
    let
        a = 1
        b = 2
        c = a + b
    print c
```
#### doなし
```haskell
main =
    let
        a = 1
        b = 2
        c = a + b in
    print c
```
# 条件分岐
## if-then-else
### 1行
```haskell
main = print $ if a == 1 then "1" else "?"
```
### 複数行
```haskell
main = do
    if a == 1
        then print "1"
        else print "?"
```
### パターンマッチ
特定の引数に対する関数の戻り値を直接定義し条件分岐する.
```haskell
f 1 = "1"
f a = "a"
f _ = "?"
```
### ガード
関数定義に特定の引数に対する戻り値を定義する.
```haskell
fact n
    | n == 0    = 1
    | otherwise = n * fact (n-1)
```
### case-of
関数定義の中でパターンマッチを行う.
```haskell
fact n = case n of
    0 -> 1
    _ | n > 0 -> n * fact (n-1)
```
# リスト
多言語における配列の概念に相当する.
```haskell
[1,2,3,4,5]
```
## 要素
```haskell
[1,2,3,4,5] !! 3 -- 4
```
## 連番リスト
```haskell
[1..5] -- [1,2,3,4,5]
```
## リスト操作
リストだけでなく文字列操作も可能.
### 結合
```haskell
[1..3] ++ [4..7] -- [1,2,3,4,5,6,7]
```
### 挿入
#### 先頭
```haskell
1:[2..5] -- [1,2,3,4,5]
1:2:[3..5] -- [1,2,3,4,5]
```
#### 末尾
```haskell
[1..4] ++ [5] -- [1,2,3,4,5]
```
### 分割
```haskell
first (x:xs) = x
first (x:_) = x
first [1..6] -- 1
second (x:y:xs) = y
second [1..6] -- 2
```
### 要素数
```haskell
length [1..4] -- 4
```
### 合計
```haskell
sum [1..4] -- 10
```
### 要素の掛け算
```haskell
product [1..4] -- 24
```
### 抽出
```haskell
take 2 [1..4] -- [1,2]
```
### 削除
```haskell
drop 2 [1..4] -- [3,4]
```
### 反転
```haskell
reverse [1..3] -- [3,2,1]
```
# タプル
数学で言う座標,ベクトルに対応する.
タプルでは要素の型が混ざっていても良い.
```haskell
addsub x y = (x+y,x-y)
a = addsub 1 2 -- (3,-1)
(a1, a2) = addsub 1 2 -- (3,-1)
```
## タプル操作
### 2要素の場合
#### 1つ目の要素
```haskell
fst (1,2) -- 1
```
#### 2つ目の要素
```haskell
snd (1,2) -- 2
```
### 3以上の要素の場合
一度変数を媒介しなければならない.
```haskell
(_,_,p3z) = (1,2,3)
p3z -- 3
```
# ライブラリ読み込み
importを使うことでライブラリを読み込むことができる.
```haskell
import Data.Char
ord 'A' -- 65
chr 65 -- 'A' 
```

# ソート
## 挿入ソート
```haskell
insert x [] = [x]
insert x (y:ys)
    | x < y     = x:y:ys
    | otherwise = y : $ insert x ys

isort [] = []
isort (x:xs) = insert x (isort xs)
```

# デバッグ
```haskell
import Debug.Trace
test x = trace ("test " ++ show x) x
traceIO $ show $ test 5
```

# リスト内包表記
```haskell
fact 0 = 1
fact n | n > 0 = n * fact (n-1)

[fact x | x <- [1..5]]
```
## 条件
```haskell
[x | x <- [1..9], x < 5] ([1,2,3,4])
```
## 組み合わせ
```haskell
[(x,y) | x <- [1..3], y <- "abc"]
```