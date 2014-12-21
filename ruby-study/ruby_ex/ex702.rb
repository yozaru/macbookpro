#! ruby -Ks
# -*- coding: Windows-31J -*-

# Student�N���X�����
class Student
  # Student�N���X�̃C���X�^���X������������
  def initialize( name, age )
    @name = name
    @age = age
  end

  # name�����̃Q�b�^�[���\�b�h
  def name
    @name
  end

  # age�����̃Q�b�^�[���\�b�h
  def age
    @age
  end

  # Student�N���X�̃C���X�^���X�̕�����\����Ԃ�
  def to_s
    "#@name, #@age"
  end
end

# Student�N���X�̃C���X�^���X���쐬����
shin = Student.new('�v�ۏH�@�^', 45)
hiroshi = Student.new('�v�ۏH�@��', 41)

# �C���X�^���X�̖��O�ƔN���\������
puts shin.to_s
puts hiroshi.to_s

# �Q�b�^�[���g���ăC���X�^���X�̖��O�ƔN���\������
puts "�����F#{shin.name}�A�N��F#{shin.age}��"
puts "�����F#{hiroshi.name}�A�N��F#{hiroshi.age}��"
