#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'webrick'               # WEBrick���g���Ƃ��ɂ͋L�q����

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

# Ctrl-C���荞�݂��������ꍇ�ɃT�[�o�[���~���鏈����o�^���Ă���
trap(:INT) do
  server.shutdown
end

# ��L�L�q�̏��������Ȃ��T�[�o�[���J�n����
server.start
