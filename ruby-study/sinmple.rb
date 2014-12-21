i = 0
c = 0
while i < 20 do
a = rand(100.0)
if a == 77 
 p a
 p "ラッキー77だよ！"
 break
elsif a == 11 || a == 22
 p a
 p "ゾロ目だよ！"
 break
end

p a
#count
i = i+1
c = c + a
end

p "合計は#{c}"
