#! ruby -Ks
# -*- coding: Windows-31J -*-

# �\�������������f�[�^���쐬����
pages = 248
price = 2500
tax = 0.05
# �w����p�͔̔����i�ɏ���ł����������̂Ƃ���
purchase_price = price * (1 + tax)

# �����f�[�^��\������
puts "�y�[�W��: " + pages.to_s + "�y�[�W"
puts "�̔����i: " + price.to_s + "�~"
puts "�w����p: " + purchase_price.to_s + "�~"
