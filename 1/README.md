# 命名規則
小文字から始めなければならない.
```
A = 1
F x = x + 1
```
# 関数の定義
## 一番シンプルな場合
```
main = print "Hello, world"
```
```
f x = x + 1
```
shell scriptのように他の言語のように括弧で囲む必要はない.
## 複数回出力
```
main = do
    print "Hello,"
    print "world"
```
```
Hello,
world
```
## 関数の値の参照
値を参照するときは,次の3つの場合が存在する.
### 一度変数を定義する場合
```
a = f 1
```
### 括弧で囲う場合
```
(f 1)
```
### $を使う場合
```
$ f 1
```
## 関数<==>演算子
### 関数==>演算子
`で関数を囲むことで演算子化できる.
```
1 `add` 2
```
### 関数<==演算子
括弧で演算子を囲むことで関数化できる.
```
(+) 1 2
```
# 変数の定義
## トップレベル変数(グローバル変数)
```
a = 1
b = 2
c = a + b
main = do
    print c
```
## ローカル変数
### where
使用箇所の真下で定義.
```
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
```
main = do
    let
        a = 1
        b = 2
        c = a + b
    print c
```
#### doなし
```
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
```
main = print $ if a == 1 then "1" else "?"
```
### 複数行
```
main = do
    if a == 1
        then print "1"
        else print "?"
```
### パターンマッチ
特定の引数に対する関数の戻り値を直接定義し条件分岐する.
```
f 1 = "1"
f a = "a"
f _ = "?"
```
### ガード
関数定義に特定の引数に対する戻り値を定義する.
```
fact n
    | n == 0    = 1
    | otherwise = n * fact (n-1)
```
### case-of
関数定義の中でパターンマッチを行う.
```
fact n = case n of
    0 -> 1
    _ | n > 0 -> n * fact (n-1)
```
# リスト
多言語における配列の概念に相当する.
```
[1,2,3,4,5]
```
## 要素
```
[1,2,3,4,5] !! 3 (4)
```
## 連番リスト
```
[1..5] ([1,2,3,4,5])
```
## リスト操作
### 結合
```
[1..3] ++ [4..7] ([1,2,3,4,5,6,7])
```
### 挿入
