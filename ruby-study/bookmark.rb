#数字を入力させる
#input = gets.chomp.to_i

p "どのページを参照しますか？番号を入力してエンターを入力してください"
p "1.Github"
p "2.Facebook"
p "3.Twitter"
p "4,Qiita"
p "5.mixi"
p "6.Google"
p "7.Jira"
p "8.Wiki"

URI = 'http://google.com/'
APPLICATION = '/Applications/Google\ Chrome.app' # バックスラッシュはスペースのエスケープ

system "open -a #{APPLICATION} #{URI}"
