#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'rubygems'  # RubyGems�ŃC���X�g�[�������Ƃ��ɂ͋L�q
require 'dbi'       # DBI���g��
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
  def initialize( sqlite_name )
    # SQLite�f�[�^�x�[�X�t�@�C���ɐڑ�
    @db_name = sqlite_name
    @dbh = DBI.connect( "DBI:SQLite3:#{@db_name}" )
    
    # �e�[�u����̍��ږ�����{��ɕς���n�b�V���e�[�u��
    @item_name = {'id' => "�L�[", 'title' => "���Ж�", 'author' => "���Җ�", 
      'page' => "�y�[�W��", 'publish_date' => "������" }
  end

  # �����f�[�^�x�[�X������������
  def initBookInfos
    puts "\n0. �����f�[�^�x�[�X�̏�����"
    print "���������܂����H(Y/y�Ȃ�폜�����s���܂�)�F"
    # �ǂݍ��񂾒l��啶���ɑ�����
    yesno = gets.chomp.upcase
    if /^Y$/ =~ yesno
      # Y��1�����̂Ƃ������A����������

      # �������łɂ��̃f�[�^�x�[�X�Ƀe�[�u��'bookinfos'������΍폜����
      @dbh.do("drop table if exists bookinfos")

      # �V����'bookinfos'�e�[�u�����쐬����
      @dbh.do("create table bookinfos (
        id              varchar(50)   not null,
        title           varchar(100)  not null,
        author          varchar(100)  not null,
        page            int           not null,
        publish_date    datetime      not null,
        primary         key(id));")
      puts "\n�f�[�^�x�[�X�����������܂����B"
    end
  end

  # �����f�[�^��o�^����
  def addBookInfo
    puts "\n1. �����f�[�^�̓o�^"
    print "�����f�[�^��o�^���܂��B"

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

    # �쐬���������f�[�^��1�������f�[�^�x�[�X�ɓo�^����
    @dbh.do("insert into bookinfos values (
            '#{key}',
            '#{book_info.title}',
            '#{book_info.author}',
            #{book_info.page},
            '#{book_info.publish_date}');")
    puts "\n�o�^���܂����B"
  end

  # �����f�[�^�̈ꗗ��\������
  def listAllBookInfos
    puts "\n2. �����f�[�^�̕\��"
    print "�����f�[�^��\�����܂��B"

    puts "\n---------------"

    # �e�[�u������f�[�^��ǂݍ���ŕ\������
    sth = @dbh.execute("select * from bookinfos")

    # select���̎��s���ʂ�1������row�Ɏ��o���A�J��Ԃ���������
    counts = 0
    sth.each do |row|
      # row��1�����̃f�[�^��ێ����Ă���̂ŁA
      # each_with_name���\�b�h�Œl�ƍ��ږ������o���ĕ\������
      row.each_with_name do |val, name|
        # ���ږ�����{�̍��ږ��ɕϊ����ĕ\������
        print "#{@item_name[name]}:"
        # ���ڂ̒l��\������(���l����t������̂�to_s�ŕ�����ɂ���)
        print "#{val.to_s}\n"
        end
      puts "----------"
      counts = counts + 1
    end
    
    # ���s���ʂ��������
    sth.finish

    puts "\n#{counts}���\�����܂����B"
  end

  # �����̑I���ƑI����̏������J��Ԃ�
  def run
    while true
      # �@�\�I����ʂ�\������
      print "
0. �����f�[�^�x�[�X�̏�����
1. �����f�[�^�̓o�^
2. �����f�[�^�̕\��
9. �I��
�ԍ���I��ł�������(0,1,2,9)�F"
      
      # �����̓��͂�҂�
      num = gets.chomp
      case 
      when '0' == num
        # �����f�[�^�x�[�X�̏�����
        initBookInfos
      when '1' == num
        # �����f�[�^�̓o�^
        addBookInfo
      when '2' == num
        # �����f�[�^�̕\��
        listAllBookInfos
      when '9' == num
        # �f�[�^�x�[�X�Ƃ̐ڑ����I������
        @dbh.disconnect
        # �A�v���P�[�V�����̏I��
        puts "\n�I�����܂����B"
        break;
      else
        # �����I��҂���ʂɖ߂�
      end
    end
  end

end

# �������炪�A�v���P�[�V�����𓮂����{��

# �A�v���P�[�V�����̃C���X�^���X�����
# �����f�[�^��SQLite3�̃f�[�^�x�[�X���w�肵�Ă���
book_info_manager = BookInfoManager.new("bookinfo_sqlite.db")

# BookInfoManager�̏����̑I���ƑI����̏������J��Ԃ�
book_info_manager.run
