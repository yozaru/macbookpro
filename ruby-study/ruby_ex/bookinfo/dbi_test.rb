#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'rubygems'
require 'dbi'     
# sqlite-ruby���Ԃ�encoding�ւ̑΍�
require './enc_patch'

#dbh���쐬���A�f�[�^�x�[�X'bookinfo_sqlite.db'�ɐڑ�����
dbh = DBI.connect( 'DBI:SQLite3:bookinfo_sqlite.db' )

p "==="
# �e�[�u���̃f�[�^����������
rows = dbh.select_all("select * from bookinfos;" )
p rows.size
p rows
# (1) �����I�u�W�F�N�g��Ԃ��Ă��邩�ǂ����`�F�b�N
rows.each do | r |
  p r['id']
  r['id'] = "A " + r['id']   # �������邽�ёS�v�f�����������
end
p rows
p "---"
# (2) �����Ԃ��Ă���I�u�W�F�N�g���`�F�b�N����Ɓc
rows2 = Array.new
dbh.select_all("select * from bookinfos;") do | r |
  rows2 << r   # �����Ő^�̕������쐬���Ċi�[����΂悢�̂��낤�c
  p rows2.size
  p r['id']    # �����ł͎��o�������e���ۂ��̂���
               # ���͓����I�u�W�F�N�g�̒��g�����������������
  p rows2
end

# (3) ���ǔz��ɓ����Ă���͓̂����I�u�W�F�N�g�ւ̎Q�Ƃ�����
p rows2.size
p rows2
rows2.each do | r |
  p r['id']    # (4) �����ł������v�f���\�������
end
p rows2.size

p "==="
# �f�[�^�x�[�X�Ƃ̐ڑ����I������
dbh.disconnect
