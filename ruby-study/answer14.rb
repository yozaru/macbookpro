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