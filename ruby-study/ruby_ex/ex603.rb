#! ruby -Ks
# -*- coding: Windows-31J -*-

# 表示したい蔵書データを作成する
pages = 248
price = 2500
tax = 0.05
# 購入費用は販売価格に消費税を加えたものとする
purchase_price = price * (1 + tax)

# 蔵書データを表示する
puts "ページ数: " + pages.to_s + "ページ"
puts "販売価格: " + price.to_s + "円"
puts "購入費用: " + purchase_price.to_s + "円"
