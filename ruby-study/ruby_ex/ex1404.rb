#! ruby -Ks
# -*- coding: Windows-31J -*-
# �z��Ƀf�[�^���쐬
fruits = [ "apple", "banana", "cherry", "fig", "grape" ]

# "sample5.txt" ���������݃��[�h�ŐV�K�ɍ쐬
file = File.open("sample5.txt",'w')
fruits.each {|fruit|
  file.puts fruit
}

# �t�@�C�������
file.close

# "sample5.txt" ��ǂݍ��݃��[�h�ŃI�[�v������
file =  open("sample5.txt")

# �t�@�C������f�[�^�����ׂēǂݍ��݁A�����\������
print file.read

# �t�@�C�������
file.close
