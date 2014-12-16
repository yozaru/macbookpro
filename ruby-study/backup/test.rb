class Yo
 attr_accessor :name, :hitpoint, :attack

 def initialize
  @name = "洋"
  @hitpoint = 20
  @attack = 3
 end

 def dead?
  @hitpoint <= 0
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
  @hitpoint <=0
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

 def initialize(yo,aya)
    @yo = Yo.new
    @aya = Aya.new
 end
 
 def attack
  damage1 = [*1..10].sample
    puts @yo.name + "の攻撃！！ %iのダメージ" % damage1
    @yo.hitpoint = @yo.hitpoint - damage1
  
  damage2 = [*1..10].sample
    puts @aya.name + "の攻撃！！ %iのダメージ" % damage2
    @aya.hitpoint = @aya.hitpoint - damage2
    puts ""

    @yo.dead? or @aya.dead? # どちらかのキャラクターの hp が無くなったかの判定
    end

 def judge
  if @yo.dead? and @aya.dead? #Draw
   puts "DRAW!!!!!!"
  elseif @aya.dead?
   puts "Yo Win!!!!!!"
  elseif @yo.dead?
   puts "Aya Win!!!!!"
  end 
 end
end 


#ゲームクラス
class Game
 #ゲーム開始
 def start
  yo = Yo.new
  aya = Aya.new
  battle = Battle.new(yo,aya)
  while yo.hitpoint >= 0 or @aya.hitpoint >= 0 do
  puts "###########################"
  puts "戦闘開始！"
  puts "洋 HP:%i, <-> あや HP:%i" % [yo.hitpoint, aya.hitpoint]
  print "ENTERキーを押下すると実行, 3を入力すると終了 > "
  input = gets.chomp.to_i
   if (input == 3)
        exit
   end
   descision = battle.attack
  end
  battle.judge 
 end

end
game=Game.new
game.start