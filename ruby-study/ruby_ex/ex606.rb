#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'date'

# �\�������������f�[�^���쐬����i���������͊e�z��̓Y���������j
titles = [ 
    "���H�A�W���C�� �\�t�g�E�F�A�J���@�ƃv���W�F�N�g�Ǘ�", 
    "����LEGO MINDSTORMS NXT ���S�u���b�N�ō�铮�����{�b�g",
    ]
authors = [ "�R�c ����", "��� �T��Y", ]
yomies = ["��܂��܂���", "�����΂��񂢂��낤", ]
publishers = [ 
    "�\�t�g���T�[�`�Z���^�[", 
    "�\�t�g�o���N�N���G�C�e�B�u", 
    ]
pages = [ 248, 164, ]
prices = [ 2500, 2400, ]
purchase_prices = [ 2650, 2520, ]

isbn_10s   = [ "4883732088", "4797338253", ]
isbn_13s   = [ "978-4883732081", "978-4797338256", ]
sizes      = [ "21 x 14.8 x 2", "23 x 18.2 x 1.6", ]
publish_dates = [ Date.new( 2005, 1, 25 ), Date.new( 2006, 12, 23 ), ]
purchase_dates = [ Date.new( 2005, 2, 2 ), Date.new( 2007, 1, 10 ), ]

# �����f�[�^��\������
titles.size.times { |i|   # titles �̗v�f�����Y������i�Ƃ��ď������J��Ԃ�
  puts "---------------"
  puts "���Ж�: " + titles[i]
  puts "���Җ�: " + authors[i]
  puts "��݂���: " + yomies[i]
  puts "�o�Ŏ�: " + publishers[i]
  puts "�y�[�W��: " + pages[i].to_s + "�y�[�W"
  puts "�̔����i: " + prices[i].to_s + "�~"
  puts "�w����p: " + purchase_prices[i].to_s + "�~"
  puts "ISBN_10: " + isbn_10s[i]
  puts "ISBN_13: " + isbn_13s[i]
  puts "���@: " + sizes[i]
  puts "������: " + publish_dates[i].to_s
  puts "�w����: " + purchase_dates[i].to_s
}

