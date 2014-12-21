##CSVでパラメータ取り込み
require "csv"

class Player
 attr_accessor :name, :hitpoint, :attack, :critical
 def dead? 
  hitpoint >= 0
  end
end

class Yo < Player
 def initialize
  table = CSV.table('csv/yo.csv')
  table.headers
  @name = table[:name][0]
  @hitpoint = table[:hitpoint][0]
  @attack = table[:attack][0]
  @critical = table[:critical][0]
 end
end

class Aya < Player
  def initialize
  table = CSV.table('csv/aya.csv')
  table.headers
  @name = table[:name][0]
  @hitpoint = table[:hitpoint][0]
  @attack = table[:attack][0]
  @critical = table[:critical][0]
 end
end

yo = Yo.new
p yo.name
