#! ruby -Ks
# -*- coding: Windows-31J -*-

# �z��Ƀf�[�^���쐬
fruits = [ "apple", "banana", "cherry", "fig", "grape" ]

# �t�@�C������ϐ��Ɋi�[����
fname = "sample7.txt"

# "sample7.txt" ���������݃��[�h�ŐV�K�ɍ쐬
open(fname,'w') {|file|
  fruits.each {|fruit|
    file.puts fruit
  }
}

# "sample7.txt" ��ǂݍ��݃��[�h�ŃI�[�v������
open(fname) {|file|
  # �t�@�C���̍s��1�s�����o���āAline�ɓǂݍ���
  file.each {|line|
    # line��\������
    print line
  }
}
# "sample7.txt" ���폜����
File.delete(fname)

# "sample7.txt" ��ǂݍ��݃��[�h�ŃI�[�v������
# �t�@�C�����폜����Ă���̂ŃG���[����������͂�
file = open(fname)
