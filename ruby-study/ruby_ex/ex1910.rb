#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'rubygems'  # RubyGems�ŃC���X�g�[�������Ƃ��ɂ͋L�q
require 'dbi'       # DBI���g��

# �f�[�^�x�[�X'fruits01.db'�ɐڑ�����
dbh = DBI.connect( 'DBI:SQLite3:fruits01.db' )

# �e�[�u���ɓo�^���ꂽ�f�[�^���폜����
# deletet���̎��s
dbh.execute("delete from products")
puts "all records are deleted."

# �T�[�o����ؒf
dbh.disconnect
