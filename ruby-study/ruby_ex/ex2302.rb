#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'webrick'               # WEBrick���g���Ƃ��ɂ͋L�q����

# �T�[�o�[�̐ݒ���������n�b�V����p�ӂ���
# �|�[�g�͒ʏ�g��80�Ԃł͂Ȃ��A�g���Ă��Ȃ����ȃ|�[�g�ԍ��ɂ��Ă���
# 8099�͋󂢂Ă������ȃ|�[�g�ԍ��̗�
# Documentroot�́A���݂̃f�B���N�g����\���u.�v���w�肵�Ă���
config = {
  :Port => 8099,
  :DocumentRoot => '.',  
}

# WEBrick��HTTP Server�N���X�̃T�[�o�[�C���X�^���X���쐬����
s = WEBrick::HTTPServer.new ( config )

# Ctrl-C���荞�݂��������ꍇ�ɃT�[�o�[���~���鏈����o�^���Ă���
trap(:INT) do
  s.shutdown
end

# ��L�L�q�̏��������Ȃ��T�[�o�[���J�n����
s.start
