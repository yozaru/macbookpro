# 主人公クラス
class Player
  attr_accessor :name, :health_point, :attack

  def initialize
    @name = "主人公"
    @health_point = 10
    ## ※ 主人公クラスかモンスタークラスの @health_point を 0 以下にしないと
    ## Battle の judges メソッドで画面に文字列が表示されません
    @attack = 5
  end

  def dead?
    @health_point <= 0
  end
end

# モンスタークラス
class Monster
  attr_accessor :name, :health_point, :attack

  def initialize
    @name = "モンスター"
    @health_point = 10
    @attack = 5
  end

  def dead?
    @health_point <= 0
  end
end


class Battle

  def initialize(player, monster)
    @player = player
    @monster = monster
  end

  def attack
    damage = 3
    puts @player.name + "の攻撃！！ %iのダメージ" % damage
    @player.health_point = @player.health_point - damage

    puts @monster.name + "の攻撃！！ %iのダメージ" % damage
    @monster.health_point = @monster.health_point - damage
    puts ""

    @player.dead? or @monster.dead? # どちらかのキャラクターの hp が無くなったかの判定
  end

  def judges
    if @player.dead? and @monster.dead?
      puts "相打ちになりました…"
    elsif @monster.dead?
      puts "主人公が勝ちました！"
    elsif @player.dead?
      puts "モンスターが勝ちました！"
    end
  end
end

player = Player.new
monster = Monster.new
battle = Battle.new(player, monster)
monster.health_point = 0 # モンスターオブジェクトのHPを0にして戦闘不能にする

battle.judges