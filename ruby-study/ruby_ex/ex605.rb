#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'date'

# �\�������������f�[�^���쐬����
publish_date = Date.new( 2005, 1, 25 )
mon_name = Date::MONTHNAMES[publish_date.mon]
abbr_mon_name = Date::ABBR_MONTHNAMES[publish_date.mon]

# �����f�[�^��\������
puts "�o�ŔN: " + publish_date.year.to_s
puts "�o�Ō��i�������O�j: " + mon_name
puts "�o�Ō��i�Z�����O�j: " + abbr_mon_name
