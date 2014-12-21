#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'rubygems'  # DBD,BDI��RubyGems�ŃC���X�g�[�������Ƃ��ɂ͋L�q
require 'dbi'       # DBI���g��

# dbh���쐬���A�f�[�^�x�[�X'students01.db'�ɐڑ�����
# �����́A�f�[�^�\�[�X��(DSN=data source name)���w�肷��
# DSN�̑�1�v�f�̓f�[�^�\�[�X�̎�ʁFDBI�ł�'DBI'
# DSN�̑�2�v�f�̓h���C�o��ʁF'SQLite3'
# DSN�̑�3�v�f�̓f�[�^�x�[�X�t�@�C�����F'students01.db'
dbh = DBI.connect( 'DBI:SQLite3:students01.db' )

# select���Ńf�[�^���������A�ǂݍ��񂾃f�[�^��\������
dbh.select_all('select * from students') do | row |
  # SQL�uselect * from students�v�����s���A
  # 1�s����row�Ŏ󂯎���ău���b�N����������
  STDOUT.print "row=#{row}           \n"
  STDOUT.print "  name = #{row[0]}\n"
  STDOUT.print "  age  = #{row[1]}\n"
  STDOUT.print "\n"
end

# �f�[�^�x�[�X�Ƃ̐ڑ����I������
dbh.disconnect
