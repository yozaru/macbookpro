#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'rubygems'  # RubyGemsでインストールしたときには記述
require 'dbi'       # DBIを使う

# データベース'fruits01.db'に接続する
dbh = DBI.connect( 'DBI:SQLite3:fruits01.db' )

# テーブルに登録されたデータを削除する
# deletet文の実行
dbh.execute("delete from products")
puts "all records are deleted."

# サーバから切断
dbh.disconnect
