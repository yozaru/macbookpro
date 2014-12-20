class Player
 def initialize(getname)
  @name = getname
 end
 def introduce
  puts "My name is #{@name} !!!"
 end
end

hoge = Player.new("maruyama_yo")
hoge.introduce
