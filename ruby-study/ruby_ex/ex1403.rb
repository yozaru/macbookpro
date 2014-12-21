#! ruby -Ks
# -*- coding: Windows-31J -*-
# "sample4.txt" を読み込みモードでオープンする
file =  open("sample4.txt")

# ファイルの行を1行ずつ取り出して、lineに読み込む
file.each {|line|
    # lineを表示する
    print line
}

# ファイルを閉じる
file.close

