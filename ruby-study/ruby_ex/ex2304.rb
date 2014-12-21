#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'webrick'
require 'date'

# �T�[�o�[�̐ݒ���������n�b�V����p�ӂ���
# �|�[�g�͒ʏ�g��80�Ԃł͂Ȃ��A�g���Ă��Ȃ����ȃ|�[�g�ԍ��ɂ��Ă���
# 8099�͋󂢂Ă������ȃ|�[�g�ԍ��̗�
# DocumentRoot�͕����̂���ꏊ
# �����ł͌��݂̃f�B���N�g����\���u.�v���w�肵�Ă���
config = {
  :Port => 8099,
  :DocumentRoot => '.',  
}

# WEBrick��HTTP Server�N���X�̃T�[�o�[�C���X�^���X���쐬����
server = WEBrick::HTTPServer.new ( config )

# mount_proc���\�b�h�ŁA�T�[�o�[�Ɏ��s���ɏ������鉞����ǉ�����
# �����ł́A"http://localhost:8099/testprog" �Ŏ��s�ł��鏈����ǉ�
# req �̓��N�G�X�g�̏��́Ares �̓��X�|���X�̃n�b�V��
server.mount_proc("/testprog") { |req, res|
  # �A�N�Z�X�������t�����X�|���X�̓��e�ɒǉ�
  res.body << "<html><body><p>�A�N�Z�X�������t��#{Date.today.to_s}�ł��B</p>"
  res.body << "<p>���N�G�X�g�̃p�X��#{req.path}�ł����B</p>"
  # ���N�G�X�g�̓��e���A�ԍ��Ȃ����X�g�ɂ��ă��X�|���X�̓��e�ɒǉ�
  res.body << "<ul>"
  req.each { |key, value|
    res.body << "<li>#{key} : #{value}</li>"
  }
  res.body << "</ul></body></html>"
}

# Ctrl-C���荞�݂��������ꍇ�ɃT�[�o�[���~���鏈����o�^���Ă���
trap(:INT) do
  server.shutdown
end

# ��L�L�q�̏��������Ȃ��T�[�o�[���J�n����
server.start
#
#class TestCGI < WEBrick::CGI
#  def do_GET(req, res)
#    res["content-type"] = "text/plain"
#    ret = "hoge\n"
#    res.body = ret
#  end
#end
#
#TestCGI.new.start()
