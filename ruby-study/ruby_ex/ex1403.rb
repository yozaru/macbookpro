#! ruby -Ks
# -*- coding: Windows-31J -*-
# "sample4.txt" ��ǂݍ��݃��[�h�ŃI�[�v������
file =  open("sample4.txt")

# �t�@�C���̍s��1�s�����o���āAline�ɓǂݍ���
file.each {|line|
    # line��\������
    print line
}

# �t�@�C�������
file.close

