#! ruby -Ks
# -*- coding: Windows-31J -*-

# �z��Ƀf�[�^���쐬
indians = [ "One little, two little, three little Indians\n",
            "Four little, five little, six little Indians\n",
            "Seven little, eight little, nine little Indians\n",
            "Ten little Indian boys.\n" ]

# "sample6.txt" ���������݃��[�h�ŐV�K�ɍ쐬
file = File.open("sample6.txt",'w')
indians.each {|indian|
  file.print indian
}

# �t�@�C�������
file.close

# "sample5.txt" ��ǂݍ��݃��[�h�ŃI�[�v������
file =  open("sample6.txt")

# �t�@�C������f�[�^�����ׂēǂݍ��݁A�����\������
print file.read

# �t�@�C�������
file.close
