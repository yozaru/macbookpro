#! ruby -Ks
# -*- coding: Windows-31J -*-
# ��Ɏg���Ă���fruit
fruit = "apple"

# �u���b�N���[�J���ϐ�fruit���󂯎��u���b�N
["grape", "fig", "banana"].each do |fruit|
# ���̃u���b�N�̒��ł�fruit�́A�u���b�N���[�J����fruit
p fruit
break if fruit == "fig"
end

# �u���b�N�𔲂����̂ŁA
# 1.9�ł͐�Ɏg���Ă���fruit�̕����w��
# 1.8�ł͗��҂͓����ϐ����g���Ă������Ƃ��킩��
p fruit
