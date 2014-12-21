#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'rubygems'  # RubyGems�ŃC���X�g�[�������Ƃ��ɂ͋L�q
require 'dbi'       # DBI���g��

# dbh��V�K�쐬���A�f�[�^�x�[�X'fruits01.db'�ɐڑ�����
# �������ɑ��݂���Ƃ��́A���̃f�[�^�x�[�X�t�@�C�����J��
dbh = DBI.connect( 'DBI:SQLite3:fruits01.db' )

# �������łɂ��̃f�[�^�x�[�X�Ƀe�[�u��'products'������΍폜����
dbh.do("drop table if exists products")
puts "table 'products' was dropped."

# �V����'products'�e�[�u�����쐬����
dbh.do("create table products (
    id              int           not null,
    title           varchar(100)  not null,
    description     text          not null,
    image_url       varchar(200)  not null,
    price           int           not null,
    date_available  datetime      not null,
    primary         key(id));")
puts "table 'products' was created."

# �f�[�^�x�[�X�Ƃ̐ڑ����I������
dbh.disconnect
