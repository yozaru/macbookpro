#! ruby -Ks
# -*- coding: Windows-31J -*-

# Student�N���X�����
class Student
  # Student�N���X�̃C���X�^���X������������
  def initialize(name, age)
    @name = name
    @age = age
  end

  # Student�N���X�̃C���X�^���X�̕�����\����Ԃ�
  def to_s
    "#@name, #@age"
  end
end

# �V�����n�b�V�����쐬���AStudent�N���X�̃C���X�^���X�𕡐��쐬����
students = { 
  :shin => Student.new( "Shin Kuboaki", 45 ),
  :shinichirou => Student.new( "Shinichirou Ooba", 35 ),
  :shingo => Student.new( "Shingo Katori", 30 ),
}

# ���ׂẴC���X�^���X�̖��O�ƔN���\������
students.each { |key, value| 
  puts "#{key} #{value.to_s}"
}

