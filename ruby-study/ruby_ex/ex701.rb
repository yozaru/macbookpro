#! ruby -Ks
# -*- coding: Windows-31J -*-

# Student�N���X�����
class Student
  # Student�N���X�̃C���X�^���X������������
  def initialize( name, age )
    @name = name
    @age = age
  end

  # Student�N���X�̃C���X�^���X�̕�����\����Ԃ�
  def to_s
    "#@name, #@age"
  end
end

# Student�N���X�̃C���X�^���X���쐬���Ashin�Ƃ������O������
shin = Student.new('�v�ۏH�@�^', 45)
hiroshi = Student.new('�v�ۏH�@��', 41)

# shin�̖��O�ƔN���\������
puts shin.to_s
puts hiroshi.to_s
