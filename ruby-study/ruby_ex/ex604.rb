#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'date'

# �\�������������f�[�^���쐬����
publish_date = Date.new( 2005, 1, 25 )
purchase_date = Date.new( 2005, 3, 15)

# �����f�[�^��\������
puts "�o�ŔN: " + publish_date.year.to_s
puts "�o�Ō�: " + publish_date.mon.to_s
puts "�w����: " + purchase_date.to_s

