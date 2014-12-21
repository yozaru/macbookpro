#! ruby -Ks
# -*- coding: Windows-31J -*-
# 配列にデータを作成
fruits = [ "apple", "banana", "cherry", "fig", "grape" ]

# "sample5.txt" を書き込みモードで新規に作成
file = File.open("sample5.txt",'w')
fruits.each {|fruit|
  file.puts fruit
}

# ファイルを閉じる
file.close

# "sample5.txt" を読み込みモードでオープンする
file =  open("sample5.txt")

# ファイルからデータをすべて読み込み、それを表示する
print file.read

# ファイルを閉じる
file.close
