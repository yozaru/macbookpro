#電車クラスの設計
class Train
 attr_accessor :company, :name, :status
 def initialize(company="JR",name="山手線",status="normal")
  @company = company
  @name = name
  @status = status
 end
 #運行状況の確認
 def unko
  if @status == "stop"
   p "#{@name}は現在運行を停止しています" 
  elsif
   p "#{@name}は現在正常運転です"
  end
 end
end

#電車クラスのインスタンス化
kameido = Train.new("東武","亀戸線","stop")
jr = Train.new

kameido.unko
jr.unko
