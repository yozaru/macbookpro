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

  # name�����̃Z�b�^�[���\�b�h
  def name=( value )
    @name = value
  end

  # age�����̃Z�b�^�[���\�b�h
  def age=( value )
    @age = value
  end

  # Student�N���X�̃C���X�^���X�̕�����\����Ԃ�
  def to_s
    "#@name, #@age"
  end
end

# Student�N���X�̃C���X�^���X���쐬����
shin = Student.new('�v�ۏH�@�^', 45)

# �Q�b�^�[���g���ăC���X�^���X�̖��O�ƔN���\������
puts "�����F#{shin.name}�A�N��F#{shin.age}��"

# �Z�b�^�[���g����shin�̖��O�ƔN���ύX����
shin.name = 'Singh, Tiger Jeet'
shin.age = 445          # �ނ͂Ȃ��400��45�΁I

# �Q�b�^�[���g����shin�̖��O�ƔN���\������
puts shin.name
puts shin.age

puts "�����F#{shin.name}�A�N��F#{shin.age}��"
