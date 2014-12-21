#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'rubygems'  # RubyGems�ŃC���X�g�[�������Ƃ��ɂ͋L�q
require 'dbi'       # DBI���g��

# �f�[�^�x�[�X'fruits01.db'�ɐڑ�����
dbh = DBI.connect( 'DBI:SQLite3:fruits01.db' )

# �e�[�u������f�[�^��ǂݍ���ŕ\������
# select���̎��s
sth = dbh.execute("select * from products")

# select���̎��s���ʂ�1������row�Ɏ��o���A�J��Ԃ���������
sth.each do |row|
  # row��1�����̃f�[�^��ێ����Ă���̂ŁA
  # each_with_name���\�b�h�Œl�ƍ��ږ������o���ĕ\������
  row.each_with_name do |val, name|
    puts "#{name}: #{val.to_s}"
  end
  puts "----------"
end

# ���s���ʂ��������
sth.finish

# �f�[�^�x�[�X�Ƃ̐ڑ����I������
dbh.disconnect
