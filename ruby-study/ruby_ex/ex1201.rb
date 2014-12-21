#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'date'

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

# BookInfoManager�N���X���`����
class BookInfoManager
  def initialize
    @book_infos = {}
  end

  # �����f�[�^���Z�b�g�A�b�v����
  def setUp
    # �������̑����f�[�^��o�^����
    @book_infos["Yamada2005"] = BookInfo.new(
      "���H�A�W���C�� �\�t�g�E�F�A�J���@�ƃv���W�F�N�g�Ǘ�",
      "�R�c ����",
      248,
      Date.new( 2005, 1, 25 ) )
    
    @book_infos["Ooba2006"] = BookInfo.new(
      "����LEGO MINDSTORMS NXT ���S�u���b�N�ō�铮�����{�b�g",
      "��� �T��Y",
      164,
      Date.new( 2006, 12, 23 ) )
  end

  # �����f�[�^��o�^����
  def addBookInfo
    # �����f�[�^1�����̃C���X�^���X���쐬����
    book_info = BookInfo.new( "", "", 0, Date.new )
    # �o�^����f�[�^�����ڂ��Ƃɓ��͂���
    print "\n"
    print "�L�[: " 
    key = gets.chomp 
    print "���Ж�: " 
    book_info.title = gets.chomp 
    print "���Җ�: "
    book_info.author = gets.chomp 
    print "�y�[�W��: "
    book_info.page = gets.chomp.to_i
    print "�����N: " 
    year = gets.chomp.to_i
    print "������: " 
    month = gets.chomp.to_i
    print "������: "
    day = gets.chomp.to_i
    book_info.publish_date = Date.new( year, month, day )

    # �쐬���������f�[�^��1�������n�b�V���ɓo�^����
    @book_infos[key] = book_info
  end

  # �����f�[�^�̈ꗗ��\������
  def listAllBookInfos
    puts "\n---------------"
    @book_infos.each { |key, info|
      print info.toFormattedString
    puts "\n---------------"
    }

  end
  
  # �����̑I���ƑI����̏������J��Ԃ�
  def run
    while true
      # �@�\�I����ʂ�\������
      print "
1. �����f�[�^�̓o�^
2. �����f�[�^�̕\��
9. �I��
�ԍ���I��ł�������(1,2,9)�F"
      
      # �����̓��͂�҂�
      num = gets.chomp
      case 
      when '1' == num
        # �����f�[�^�̓o�^
        addBookInfo
      when '2' == num
        # �����f�[�^�̕\��
        listAllBookInfos
      when '9' == num
        # �A�v���P�[�V�����̏I��
        break;
      else
        # �����I��҂���ʂɖ߂�
      end
    end
  end

end

# �A�v���P�[�V�����̃C���X�^���X�����
book_info_manager = BookInfoManager.new

# BookInfoManager�̑����f�[�^���Z�b�g�A�b�v����
book_info_manager.setUp

# BookInfoManager�̏����̑I���ƑI����̏������J��Ԃ�
book_info_manager.run

