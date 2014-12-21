#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'date'

puts Date.new( 2009,5,5 ).to_s

# 変数名がつけてある場合
hinamatsuri = Date.new( 2009,3,3 )
puts hinamatsuri.to_s
