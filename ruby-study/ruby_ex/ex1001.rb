#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'date'

# ����1�����̑����f�[�^�̃N���X�����
class BookInfo
  # BookInfo�N���X�̃C���X�^���X������������
  def initialize( title, author, page, publish_date )
    @title = title
    @author = author
    @page = page
    @publish_date = publish_date
  end

  # �ŏ��Ɍ������鑮���ɑ΂���A�N�Z�T��񋟂���
  attr_accessor :title, :author, :page, :publish_date

  # BookInfo�N���X�̃C���X�^���X�̕�����\����Ԃ�
  def to_s
    "#@title, #@author, #@page, #@publish_date"
  end
end

# �������̑����f�[�^��o�^����
book_infos = Hash.new
book_infos["Yamada2005"] = BookInfo.new(
  "���H�A�W���C�� �\�t�g�E�F�A�J���@�ƃv���W�F�N�g�Ǘ�",
  "�R�c ����",
  248,
  Date.new( 2005, 1, 25 ) )

book_infos["Ooba2006"] = BookInfo.new(
  "����LEGO MINDSTORMS NXT ���S�u���b�N�ō�铮�����{�b�g",
  "��� �T��Y",
  164,
  Date.new( 2006, 12, 23 ) )

# �o�^���������f�[�^�𕶎���\����1�����o�͂���
# value��BookInfo�N���X�̃C���X�^���X�S���Ă��鎖�ɒ���
book_infos.each { |key, value|
  puts "#{key}: #{value.to_s}"
}
