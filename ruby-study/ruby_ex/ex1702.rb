#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'date'
require 'pstore'

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
  def initialize( pstore_name )
    # PStore�f�[�^�x�[�X�t�@�C�����w�肵�ď�����
    @db = PStore.new(pstore_name)
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

    # �쐬���������f�[�^��1������PStore�f�[�^�x�[�X�ɓo�^����
    @db.transaction do
      # �����f�[�^��PStore�ɕۑ�����
      @db[key] = book_info
    end
  end

  # �����f�[�^�̈ꗗ��\������
  def listAllBookInfos
    puts "\n---------------"
    @db.transaction(true) do    # �ǂݍ��݃��[�h
      # roots ���L�[�̔z���Ԃ��Aeach �ł����1��������
      @db.roots.each { |key|
        # ����ꂽ�L�[���g����PStore���瑠���f�[�^�iBookInfo�j���擾
        # ��������������ďo�͂���
        puts "�L�[: #{key}"
        print @db[key].toFormattedString
        puts "\n---------------"
      }
    end
  end

  # �����f�[�^���폜����
  def delBookInfo
    # �L�[���w�肵�Ă��炤
    print "\n"
    print "�L�[���w�肵�Ă��������F"
    key = gets.chomp 
    
    # �폜�Ώۃf�[�^���m�F���Ă���폜����
    @db.transaction do
      if @db.root?(key)
        print @db[key].toFormattedString
        print "\n�폜���܂����H(Y/y�Ȃ�폜�����s���܂�)�F"
        # �ǂݍ��񂾒l��啶���ɑ�����
        yesno = gets.chomp.upcase
        if /^Y$/ =~ yesno
          # Y��1�����̂Ƃ������APStore�f�[�^�x�[�X����폜����
          @db.delete(key)
          puts "\n�f�[�^�x�[�X����폜���܂���"
        end
      end
    end
  end

  # �����̑I���ƑI����̏������J��Ԃ�
  def run
    while true
      # �@�\�I����ʂ�\������
      print "
1. �����f�[�^�̓o�^
2. �����f�[�^�̕\��
3. �����f�[�^�̍폜
9. �I��
�ԍ���I��ł�������(1,2,3,9)�F"
      
      # �����̓��͂�҂�
      num = gets.chomp
      case 
      when '1' == num
        # �����f�[�^�̓o�^
        addBookInfo
      when '2' == num
        # �����f�[�^�̕\��
        listAllBookInfos
      when '3' == num
        # �����f�[�^�̍폜
        delBookInfo
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
# �����f�[�^��PStore�f�[�^�x�[�X���w�肵�Ă���
book_info_manager = BookInfoManager.new("book_info.db")

# BookInfoManager�̏����̑I���ƑI����̏������J��Ԃ�
book_info_manager.run
