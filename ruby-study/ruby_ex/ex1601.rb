#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'date'

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

  # BookInfo�N���X�̃C���X�^���X��CSV�`���֕ϊ�����
  def to_csv( key )
    "#{key},#{@title},#{@author},#{@page},#{@publish_date}\n"
  end

  # BookInfo�N���X�̃C���X�^���X�̕�����\����Ԃ�
  def to_s
    "#{@title}, #{@author}, #{@page}, #{@publish_date}"
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
  def initialize( filename )
    # ��������csv�t�@�C�����w�肷��
    @csv_fname = filename
    # �����f�[�^�̃n�b�V��
    @book_infos = {}
  end

  # �����f�[�^���Z�b�g�A�b�v����
  def setUp
    # CSV�t�@�C����ǂݍ��݃��[�h�ŃI�[�v������
    open(@csv_fname) {|file|
      # �t�@�C���̍s��1�s�����o���āAline�ɓǂݍ���
      file.each {|line|
        # line����chomp�ŉ��s�������Asplit�ŃJ���}��؂�ɕ������A
        # ���ӂ̂��ꂼ��̍��ڂ֑��d�������
        key, title, author, page, pdate = line.chomp.split(',')
        # �����f�[�^1�����̃C���X�^���X���쐬���ăn�b�V���ɓo�^����
        # strptime�́A�����񂩂�Date�N���X�̃C���X�^���X�쐬���郁�\�b�h
        @book_infos[ key ] = 
          BookInfo.new(title, author, page.to_i, Date.strptime(pdate))
      }  # 1�s���̏����̏I���
    }  # �t�@�C������Ă���
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

  # �����f�[�^��S���t�@�C���֏�������ŕۑ�����
  def saveAllBookInfos
    # CSV�t�@�C�����������݃��[�h�ŃI�[�v������
    open(@csv_fname, "w") {|file|
      @book_infos.each { |key, info|
        file.print( info.to_csv( key ))
      }  # 1�s���̏����̏I���
      puts "\n�t�@�C���֕ۑ����܂���"
    }  # �t�@�C������Ă���
  end

  # �����̑I���ƑI����̏������J��Ԃ�
  def run
    while true
      # �@�\�I����ʂ�\������
      print "
1. �����f�[�^�̓o�^
2. �����f�[�^�̕\��
8. �����f�[�^���t�@�C���֕ۑ�
9. �I��
�ԍ���I��ł�������(1,2,8,9)�F"
      
      # �����̓��͂�҂�
      num = gets.chomp
      case 
      when '1' == num
        # �����f�[�^�̓o�^
        addBookInfo
      when '2' == num
        # �����f�[�^�̕\��
        listAllBookInfos
      when '8' == num
        # �����f�[�^���t�@�C���֕ۑ�
        saveAllBookInfos
      when '9' == num
        # �A�v���P�[�V�����̏I��
        break;
      else
        # �����I��҂���ʂɖ߂�
      end
    end
  end

end

# �������炪�A�v���P�[�V�����𓮂����{��

# �A�v���P�[�V�����̃C���X�^���X�����
# �����f�[�^��CSV�t�@�C�����w�肵�Ă���
book_info_manager = BookInfoManager.new("book_info.csv")

# BookInfoManager�̑����f�[�^���Z�b�g�A�b�v����
book_info_manager.setUp

# BookInfoManager�̏����̑I���ƑI����̏������J��Ԃ�
book_info_manager.run
