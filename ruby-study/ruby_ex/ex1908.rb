#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'rubygems'  # RubyGems�ŃC���X�g�[�������Ƃ��ɂ͋L�q
require 'dbi'       # DBI���g��

# �f�[�^�x�[�X'fruits01.db'�ɐڑ�����
dbh = DBI.connect( 'DBI:SQLite3:fruits01.db' )

# �e�[�u���Ƀf�[�^��ǉ�����
dbh.do("insert into products values (
    1,
    '���',
    '�ʖ��u��̉��v�Ƃ�΂�鍑���ł��B',
    '/images/kokkou.jpg',
    '300',
    '2009-02-01 09:15:00'
);")

dbh.do("insert into products values(
    2,
    '�}���S�[',
    '�{�薼�Y�u���z�̂��܂��v�ł��B',
    '/images/mango.jpg',
    '2000',
    '2009-03-20 00:00:00'
);")

puts "2 records inserted."

# �f�[�^�x�[�X�Ƃ̐ڑ����I������
dbh.disconnect
