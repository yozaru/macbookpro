#! ruby -Ks
# -*- coding: Windows-31J -*-
# 先に使っているfruit
fruit = "apple"

# ブロックローカル変数fruitを受け取るブロック
["grape", "fig", "banana"].each do |fruit|
# このブロックの中でのfruitは、ブロックローカルなfruit
p fruit
break if fruit == "fig"
end

# ブロックを抜けたので、
# 1.9では先に使っていたfruitの方を指す
# 1.8では両者は同じ変数を使っていたことがわかる
p fruit
