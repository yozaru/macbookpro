#! ruby -Ks
# -*- coding: Windows-31J -*-

# �V�����n�b�V�������
friends = { 
  :shin => "Shin Kuboaki", 
  :shinichirou => "Shinichirou Ooba", 
  :shingo => "Shingo Katori" 
}

# �n�b�V���̗v�f���ЂƂ���������
# �J��Ԃ��s�x�A�L�[�ƒl���u���b�N���̃��[�J���ϐ�key, value�ɓn��
friends.each { |key, value| 
  # ���[�J���ϐ��̒l��\������
  puts "#{key} #{value}"
}

