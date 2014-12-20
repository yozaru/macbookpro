#test
ID_YO = 1
ID_AYA = 2

class Player
  def initialize(id)
    if id == ID_YO then
      @name = "yo"
    elsif id == ID_AYA then
      @name ="aya"
    else
      @name = "unknown"
    end
  end

  def introduce
    puts "My name is #{@name} !!!"
  end
end

yo = Player.new(ID_AYA)
yo.introduce
