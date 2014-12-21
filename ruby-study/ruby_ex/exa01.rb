#! ruby -Ks
# -*- coding: Windows-31J -*-
# ローカル変数furitを定義する
furit = "apple"

# ブロックローカル変数furitを受け取るブロック(ローカル変数のxとは別！)
["grape", "fig", "banana"].each do |furit|
  # このブロックの中でxの参照はブロックローカル変数の方を指す
  p furit
  break if furit == "fig"
end

# ブロックを出るとxはローカル変数の方を指すようになる
p furit
