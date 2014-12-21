#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'date'

# ����1�����̑����f�[�^�̃N���X�����
class BookInfo
  # Bookinfo�N���X�̃C���X�^���X������������
  def initialize( title, author, page, publish_date )
    @title = title
    @author = author
    @page = page
    @publish_date = publish_date
  end

  # �ŏ��Ɍ������鑮���ɑ΂���A�N�Z�T��񋟂���
  attr_accessor :title, :author, :page, :publish_date
  
  # Bookinfo�N���X�̃C���X�^���X�̕�����\����Ԃ�
  def to_s
    "#@title, #@author, #@page, #@publish_date"
  end
  
  # �����f�[�^�����������ďo�͂��鑀���ǉ�����
  # ���ڂ̋�؂蕶���������Ɏw�肷�邱�Ƃ��ł���
  # �������ȗ������ꍇ�͉��s����؂蕶���ɂ���
  def toFormattedString( sep = "\n" )
    "���Ж�: #{@title}#{sep}���Җ�: #{@author}#{sep}�y�[�W��: #{@page}�y�[�W#{sep}������: #{@publish_date}#{sep}"
  end
end

# BookInfo�N���X�̃C���X�^���X���쐬���Abook_info�Ƃ������O������
book_info = BookInfo.new(
  "���H�A�W���C�� �\�t�g�E�F�A�J���@�ƃv���W�F�N�g�Ǘ�", 
  "�R�c ����",
  248,
  Date.new( 2005, 1, 25 ) )

# book_info�̃f�[�^�̕�����\���𓾂�
puts book_info.to_s

# book_info�̏��������ďo�͂��鑀����g���Ă݂�
puts book_info.toFormattedString
puts book_info.toFormattedString( "/" )
