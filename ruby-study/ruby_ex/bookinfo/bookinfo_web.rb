#! ruby -Ks
# -*- coding: cp932 -*-
require 'webrick'
require 'erb'    
require 'rubygems'
require 'dbi'     
require './enc_patch' # sqlite-ruby���Ԃ�encoding�ւ̑΍�

config = {
  :Port => 8099,
  :DocumentRoot => '.',
  }

# �g���qerb�̃t�@�C����ERB���Ăяo���ď�������ERBHandler�Ɗ֘A�t����
WEBrick::HTTPServlet::FileHandler.add_handler("erb", WEBrick::HTTPServlet::ERBHandler)

# WEBrick��HTTP Server�N���X�̃T�[�o�[�C���X�^���X���쐬����
server = WEBrick::HTTPServer.new( config )

# erb��MIME�^�C�v��ݒ�
server.config[:MimeTypes]["erb"] = "text/html"

# �ꗗ�\������̏���
# "http://localhost:8099/list" �ŌĂяo�����
server.mount_proc("/list") { |req, res|
  p req.query
  # 'operation'�̒l�̌�́i.delete, .edit�j�ŏ����𕪊򂷂�
  if /(.*)\.(delete|edit)$/ =~ req.query['oparation']
    target_id = $1
    operation = $2
    # �I�����ꂽ���������s�����ʂɈڍs����
    # ERB���AERBHandler���o�R�����ɒ��ڌĂяo���ė��p���Ă���
    if operation == 'delete'
      template = ERB.new( File.read('delete.erb') )
    elsif operation == 'edit'
      template = ERB.new( File.read('edit.erb') )
    end
    res.body << template.result( binding )
  else # �f�[�^���I������Ă��Ȃ��Ȃ�
    template = ERB.new( File.read('noselected.erb') )
    res.body << template.result( binding )
  end
}

# �o�^�̏���
# "http://localhost:8099/entry" �ŌĂяo�����
server.mount_proc("/entry") { |req, res|
  # �i���Ӂj�{���Ȃ炱���œ��̓f�[�^�Ɋ댯��
  # �s�����Ȃ����`�F�b�N���邪�A���K�̌��ʂ��̂��߂Ɋ������Ă���
  p req.query
  #dbh���쐬���A�f�[�^�x�[�X'bookinfo_sqlite.db'�ɐڑ�����
  dbh = DBI.connect( 'DBI:SQLite3:bookinfo_sqlite.db' )
  
  # id���g���Ă�����o�^�ł��Ȃ����Ƃɂ���
  rows = dbh.select_one("select * from bookinfos where id='#{req.query['id']}';")
    if rows then
    # �f�[�^�x�[�X�Ƃ̐ڑ����I������ %>
    dbh.disconnect
    
    # �����̌��ʂ�\������
    # ERB���AERBHandler���o�R�����ɒ��ڌĂяo���ė��p���Ă���
    template = ERB.new( File.read('noentried.erb') )
    res.body << template.result( binding )
  else
    # �e�[�u���Ƀf�[�^��ǉ�����
    dbh.do("insert into bookinfos
   values('#{req.query['id']}','#{req.query['title']}',
   '#{req.query['author']}','#{req.query['page']}',
   '#{req.query['publish_date']}');")
    
    # �f�[�^�x�[�X�Ƃ̐ڑ����I������ %>
    dbh.disconnect
    
    # �����̌��ʂ�\������
    # ERB���AERBHandler���o�R�����ɒ��ڌĂяo���ė��p���Ă���
    template = ERB.new( File.read('entried.erb') )
    res.body << template.result( binding )
  end
}

# �폜�̏���
# "http://localhost:8099/delete" �ŌĂяo�����
server.mount_proc("/delete") { |req, res|
  # �i���Ӂj�{���Ȃ炱���œ��̓f�[�^�Ɋ댯��
  # �s�����Ȃ����`�F�b�N���邪�A���K�̌��ʂ��̂��߂Ɋ������Ă���
  p req.query
  #dbh���쐬���A�f�[�^�x�[�X'bookinfo_sqlite.db'�ɐڑ�����
  dbh = DBI.connect( 'DBI:SQLite3:bookinfo_sqlite.db' )
  
  # �e�[�u������f�[�^���폜����
  dbh.do("delete from bookinfos where id='#{req.query['id']}';")
  
  # �f�[�^�x�[�X�Ƃ̐ڑ����I������ %>
  dbh.disconnect
  
  # �����̌��ʂ�\������
  # ERB���AERBHandler���o�R�����ɒ��ڌĂяo���ė��p���Ă���
  template = ERB.new( File.read('deleted.erb') )
  res.body << template.result( binding )
}

# �C���̏���
# "http://localhost:8099/edit" �ŌĂяo�����
server.mount_proc("/edit") { |req, res|
  # �i���Ӂj�{���Ȃ炱���œ��̓f�[�^�Ɋ댯��
  # �s�����Ȃ����`�F�b�N���邪�A���K�̌��ʂ��Ɋ������Ă���
  p req.query
  #dbh���쐬���A�f�[�^�x�[�X'bookinfo_sqlite.db'�ɐڑ�����
  dbh = DBI.connect( 'DBI:SQLite3:bookinfo_sqlite.db' )
  
  # �e�[�u���̃f�[�^���X�V����i�����̂Ő܂�Ԃ��Ă���j�j
  dbh.do("update bookinfos set id='#{req.query['id']}',\
    title='#{req.query['title']}',\
    author='#{req.query['author']}',\
    page='#{req.query['page']}',\
    publish_date='#{req.query['publish_date']}'\
    where id='#{req.query['id']}';")
  
  # �f�[�^�x�[�X�Ƃ̐ڑ����I������ %>
  dbh.disconnect
  
  # �����̌��ʂ�\������
  # ERB���AERBHandler���o�R�����ɒ��ڌĂяo���ė��p���Ă���
  template = ERB.new( File.read('edited.erb') )
  res.body << template.result( binding )
}

# �����̏���
# "http://localhost:8099/retrieve" �ŌĂяo�����
server.mount_proc("/retrieve") { |req, res|
  # �i���Ӂj�{���Ȃ炱���œ��̓f�[�^�Ɋ댯��
  # �s�����Ȃ����`�F�b�N���邪�A���K�̌��ʂ��Ɋ������Ă���
  p req.query
  
  # ���������̐��� 
  a = ['id','title','author','page','publish_date']
  # �₢���킹�����̂���v�f�ȊO���폜
  a.delete_if {|name| req.query[name] == "" }

  if a.empty?
    where_data = ""
  else
    # �c�����v�f����������������ɕϊ�
    a.map! {|name| "#{name}='#{req.query[name]}'" }
    # �v�f������Ƃ��́Awhere ��ɒ���
    #�i����A���ڂ��Ƃ̊��S��v��or�����j
    where_data = "where " +  a.join(' or ')   
  end
  
  # �����̌��ʂ�\������
  # ERB���AERBHandler���o�R�����ɒ��ڌĂяo���ė��p���Ă���
  template = ERB.new( File.read('retrieved.erb') )
  res.body << template.result( binding )

}

# Ctrl-C���荞�݂��������ꍇ�ɃT�[�o�[���~���鏈����o�^���Ă���
trap(:INT) do
  server.shutdown
end

# ��L�L�q�̏��������Ȃ��T�[�o�[���J�n����
server.start