#! ruby -Ks
# -*- coding: Windows-31J -*-

# "sample4.txt" ��ǂݍ��݃��[�h�ŃI�[�v������
open("sample4.txt") {|file|     # �����̓u���b�N�Ƃ��ēn��

  # �t�@�C���̍s��1�s�����o���āAline�ɓǂݍ���
  file.each {|line|
    # line��\������
    print line
  }

}  # ���̃u���b�N�𔲂���ƃt�@�C���͎����I�ɕ��Ă��炦��


