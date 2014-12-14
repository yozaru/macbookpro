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

p = Yo.new
puts "@洋のパラメータ"
puts "-------------------------"
puts "名前:" + p.name
puts "体力:" + p.hitpoint.to_s
puts "攻撃力:" + p.attack.to_s
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

p = Aya.new
puts "@アヤのパラメータ"
puts "-------------------------"
puts "名前:" + p.name
puts "体力:" + p.hitpoint.to_s
puts "攻撃力:" + p.attack.to_s
puts "-------------------------"

