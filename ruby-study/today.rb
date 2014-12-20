#引数を使った例

class Student
 attr_accessor :name, :hitpoint, :attack
 def initialize ( name, age , attack)
  @name = name
  @age = age
  @age = attack
 end
 def to_s
  "#@name, #@age" 
 end
end

yo = Student.new('yo',36,100)
aya = Student.new('aya',35,200)
inoue = Student.new('inoue',25,1000)
p yo.to_s
p aya.to_s
p inoue.to_s
