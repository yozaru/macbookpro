#! ruby -Ks
# -*- coding: Windows-31J -*-

str = "Twinkle, twinkle, little star,
How I wonder what you are.
Up above the world so high,
Like a diamond in the sky.
Twinkle, twinkle, little star,
How I wonder what you are."

# ��̉̎����s���Ƃɕ�����lines�Ƃ����z��Ɋi�[����
lines = str.split(/\n/)

# "you"�Ƀ}�b�`����s��\������
puts "you���܂܂�Ă����s"
lines.each { |line|
  if line =~ /[Yy]ou/ then
    puts line
  end
}

puts ""

# �s����","�����Ă���s��\������
puts "�s���ɃJ���}���܂܂�Ă����s"
lines.each { |line|
  if line =~ /,$/ then
    puts line
  end
}

puts ""

# "i"������2����������"l"�����镶���񂪊܂܂��
puts '"i"������2����������"l"�����镶���񂪊܂܂��s'
lines.each { |line|
  if line =~ /i..l/ then
    puts line
  end
}

