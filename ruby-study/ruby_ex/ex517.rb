#! ruby -Ks
# -*- coding: Windows-31J -*-

fruits_prices = [ ["apple", 200], ["orange", 100], ["melon", 600] ]

fruits_prices.each { |fp| 
  puts "���O�F#{fp[0]}�A�l�i�F#{fp[1]}�~"
}

sum = 0
fruits_prices.each { |fp| sum += fp[1] }
puts "1�������ƑS����#{sum}�~�ł��B"
