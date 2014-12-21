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

# StudentBook�A�v���P�[�V�����̃N���X�����
class StudentBook
  def inisitalize 
    @students = {}
  end

  # �n�b�V����Student�N���X�̃C���X�^���X�𕡐��쐬����
  def setUpStudents
    @students = {                  # students���C���X�^���X�ϐ��ɕύX
      :shin => Student.new( "Shin Kuboaki", 45 ),
      :shinichirou => Student.new( "Shinichirou Ooba", 35 ),
      :shingo => Student.new( "Shingo Katori", 30 ),
    }
  end

  # ���ׂẴC���X�^���X�̖��O�ƔN���\������
  # �������葱���ɂ���
  def printStudents
    @students.each { |key, value|   # students���C���X�^���X�ϐ��ɕύX
      puts "#{key} #{value.to_s}"
    }
  end

  # StudentBook���f�[�^�����X�g����
  def listAllStudents
    # Student�N���X�̃C���X�^���X�̍쐬
    setUpStudents
    # Student�N���X�̃C���X�^���X�̕\��
    printStudents
  end
end

# StudentBook�N���X�̃C���X�^���X���쐬����
student_book = StudentBook.new
# Student�N���X�̃C���X�^���X�̕\��
student_book.listAllStudents

