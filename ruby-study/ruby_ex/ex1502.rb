#! ruby -Ks
# -*- coding: Windows-31J -*-

# �s�ԍ��p�̕ϐ�
line_no = 0

# "sample4.txt" ��ǂݍ��݃��[�h�ŃI�[�v������
file =  open("sample4.txt")

# �t�@�C���̏I���܂ŁA1�s����line�ɓǂݍ���
while( line = file.gets ) 

    # �ǂݍ��񂾍s��ǂݍ��񂾍s���Ƌ��ɕ\������
    line_no += 1
    print( "#{line_no}: #{line}" )
end

# �t�@�C�������
file.close

