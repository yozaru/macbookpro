#! ruby -Ks
# -*- coding: Windows-31J -*-
# 配列にデータを作成
fruits = [ "apple", "banana", "cherry", "fig", "grape" ]

# ファイル名を変数に格納する
fname = "sample7.txt"

# "sample7.txt" を書き込みモードで新規に作成
open(fname,'w') {|file|
  fruits.each {|fruit|
    file.puts fruit
  }
}

# "sample7.txt" を読み込みモードでオープンする
open(fname) {|file|
  # ファイルの行を1行ずつ取り出して、lineに読み込む
  file.each {|line|
    # lineを表示する
    print line
  }
}
# "sample7.txt" を削除する
File.delete(fname)

# "sample7.txt" を読み込みモードでオープンする
# ファイルが削除されているのでエラーが発生するはず
file = open(fname)
