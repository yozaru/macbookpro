#! ruby -Ks
# -*- coding: Windows-31J -*-

# �V�����n�b�V�������
friends = { 
  :shin => "Shin Kuboaki", 
  :shinichirou => "Shinichirou Ooba", 
  :shingo => "Shingo Katori" 
}

# �n�b�V���̃L�[���ЂƂ���������
# �J��Ԃ��s�x�A�L�[���u���b�N���̃��[�J���ϐ�key�ɓn��
friends.each_key { |key| 
  # ���[�J���ϐ��i�L�[�j�̒l��\������
  puts "#{key} "
}
