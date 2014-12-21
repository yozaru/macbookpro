#! ruby -Ks
# -*- coding: Windows-31J -*-

# "sample4.txt" を読み込みモードでオープンする
open("sample4.txt") {|file|     # 処理はブロックとして渡す

  # ファイルの行を1行ずつ取り出して、lineに読み込む
  file.each {|line|
    # lineを表示する
    print line
  }

}  # このブロックを抜けるとファイルは自動的に閉じてもらえる


