#! ruby -Ks
# -*- coding: Windows-31J -*-

# �V�����n�b�V�������
friends = {
  :shin => "Shin Kuboaki",
  :shinichirou => "Shinichirou Ooba",
  :shingo => "Shingo Katori"
}

# �n�b�V���ɗv�f��ǉ�����
friends[ :shinsaku ] = "Shinsaku Takasugi"

# �n�b�V���̗v�f����������(������͂��j
puts friends.include?( :shinsaku )
puts friends[:shinsaku ]

# �ǉ������v�f���폜����
friends.delete( :shinsaku )

# �n�b�V���̗v�f����������i������Ȃ��͂��j
if friends.include?( :shinsaku ) then
  puts friends[:shinsaku ]
else
  puts "�݂���܂���"
end
