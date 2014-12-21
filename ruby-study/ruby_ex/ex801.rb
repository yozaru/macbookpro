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
end

# BookInfo�N���X�̃C���X�^���X���쐬���Abook_info�Ƃ������O������
book_info = BookInfo.new(
  "���H�A�W���C�� �\�t�g�E�F�A�J���@�ƃv���W�F�N�g�Ǘ�", 
  "�R�c ����",
  248,
  Date.new( 2005, 1, 25 ) )

# book_info�̃f�[�^�̕�����\���𓾂�
puts book_info.to_s

# book_info�̃A�N�Z�T���g���Ă݂�
puts "���Ж�: " + book_info.title
puts "���Җ�: " + book_info.author
puts "�y�[�W��: " + book_info.page.to_s + "�y�[�W"
puts "������: " + book_info.publish_date.to_s
