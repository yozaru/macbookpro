class Yo
 attr_accessor :name, :hitpoint, :attack

 def initialize
  @name = "洋"
  @hitpoint = 20
  @attack = 3
 end

 def dead?
  @hp <=0
 end
end

yo = Yo.new
puts "@洋のパラメータ"
puts "-------------------------"
puts "名前:" + yo.name
puts "体力:" + yo.hitpoint.to_s
puts "攻撃力:" + yo.attack.to_s
puts "-------------------------"

class Aya
 attr_accessor :name, :hitpoint, :attack

 def initialize
  @name = "アヤ"
  @hitpoint = 10
  @attack = 5
 end

 def dead?
  @hp <=0
 end
end

aya = Aya.new
puts "@アヤのパラメータ"
puts "-------------------------"
puts "名前:" + aya.name
puts "体力:" + aya.hitpoint.to_s
puts "攻撃力:" + aya.attack.to_s
puts "-------------------------"

#Display Class
 
