#! ruby -Ks
# -*- coding: Windows-31J -*-
require 'pstore'

# ��������쐬
juce = "orange juce"
# �z��Ƀf�[�^���쐬
fruits = [ "apple", "banana", "cherry", "fig", "grape" ]

# PStore�f�[�^�x�[�X���쐬����
db = PStore.new('fruitdb')

# PStore�Ƀf�[�^����������
db.transaction do
  # �������PStore�ɕۑ�����
  db["drink"] = juce  
  # �z���PStore�ɕۑ�����
  db["fruits"] = fruits
end          # PStore�ɕۑ������̂́Atransaction���\�b�h�𔲂���Ƃ�

# PStore����f�[�^��ǂݍ���ŕ\������
db.transaction(true) do 
  puts "drink: #{db["drink"] }"
  puts "fruits: #{db["fruits"].join(", ")}"
end 

# PStore���ǂݍ��݃��[�h�̂Ƃ���
# �����������Ƃ���ƃG���[�ɂȂ�
db.transaction(true) do 
  db["drink"] = "grape juce"
end 
