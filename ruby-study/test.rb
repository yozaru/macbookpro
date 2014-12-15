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

#Display Class
class Display
 #パラメータ表示
 def parameter
  yo = Yo.new
  aya = Aya.new
  puts "@洋のパラメータ"
  puts "-------------------------"
  puts "名前:" + yo.name
  puts "体力:" + yo.hitpoint.to_s
  puts "攻撃力:" + yo.attack.to_s
  puts "-------------------------"
  puts "@アヤのパラメータ"
  puts "-------------------------"
  puts "名前" + aya.name
  puts "体力:" + aya.hitpoint.to_s
  puts "攻撃力:" + aya.attack.to_s
  puts "-------------------------"
 end
end

display= Display.new
puts display.parameter

#戦闘クラス
class Battle

 def initialize(yo, aya)
    @yo = yo
    @aya = aya
 end
 
 def attack
  damege = 3
    puts yo.name + "の攻撃！！ %iのダメージ" % damage
    yo.hitpoint = yo.hitpoint - damage

    puts aya.name + "の攻撃！！ %iのダメージ" % damage
    aya.hitpoint = aya.hitpoint - damage
    puts ""

    @yo.dead? or @aya.dead? # どちらかのキャラクターの hp が無くなったかの判定
    end
end 

battle = Battle.new
battle.attack
