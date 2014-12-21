#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'rubygems'
require 'dbi'     
# sqlite-rubyが返すencodingへの対策
require './enc_patch'

#dbhを作成し、データベース'bookinfo_sqlite.db'に接続する
dbh = DBI.connect( 'DBI:SQLite3:bookinfo_sqlite.db' )

p "==="
# テーブルのデータを検索する
rows = dbh.select_all("select * from bookinfos;" )
p rows.size
p rows
# (1) 同じオブジェクトを返しているかどうかチェック
rows.each do | r |
  p r['id']
  r['id'] = "A " + r['id']   # これをやるたび全要素が書き換わる
end
p rows
p "---"
# (2) 逐次返しているオブジェクトをチェックすると…
rows2 = Array.new
dbh.select_all("select * from bookinfos;") do | r |
  rows2 << r   # ここで真の複製を作成して格納すればよいのだろう…
  p rows2.size
  p r['id']    # ここでは取り出した内容っぽいのだが
               # 実は同じオブジェクトの中身が書き換わったもの
  p rows2
end

# (3) 結局配列に入っているのは同じオブジェクトへの参照だから
p rows2.size
p rows2
rows2.each do | r |
  p r['id']    # (4) ここでも同じ要素が表示される
end
p rows2.size

p "==="
# データベースとの接続を終了する
dbh.disconnect
