#! ruby -Ks
# -*- coding: Windows-31J -*-
# "sample4.txt" を読み込みモードでオープンする
file =  open("sample4.txt")

# ファイルからデータをすべて読み込み、それを表示する
print file.read

# ファイルを閉じる
file.close
