#! ruby -Ks
# -*- coding: Windows-31J -*-
# ���[�J���ϐ�furit���`����
furit = "apple"

# �u���b�N���[�J���ϐ�furit���󂯎��u���b�N(���[�J���ϐ���x�Ƃ͕ʁI)
["grape", "fig", "banana"].each do |furit|
  # ���̃u���b�N�̒���x�̎Q�Ƃ̓u���b�N���[�J���ϐ��̕����w��
  p furit
  break if furit == "fig"
end

# �u���b�N���o���x�̓��[�J���ϐ��̕����w���悤�ɂȂ�
p furit
