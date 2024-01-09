require 'date'
require 'optparse'

month = []
opt = OptionParser.new
opt.on('-m int') { |v| month << v.to_i }

opt.parse!(ARGV)
puts

today = Date.today

# monthは空？空であれば今月の月を空でなければ指定された月をmonthに入れる
month = month.empty? ? today.month : month[0]

unless month.between?(1, 12) # 指定されたオプションが１〜１２月を外れていた場合
  raise "#{month} is neither a month number (1..12) nor a name"
end

first_date = Date.new(2024, month, 1)
last_date = Date.new(2024, month, -1)

print '      ' + first_date.month.to_s + '月' + ' ' + first_date.year.to_s

puts
print '月 火 水 木 金 土 日'
puts

# スタート位置を初日の曜日を確認することで決める
space = -1 + first_date.wday.to_i
space = space.negative? ? 6 : space

print '   ' * space # 曜日ごとに半角スペース✖️3の位置変更を入れる

# 日付の出力
(first_date..last_date).each do |date|
  print date.mday.to_s.rjust(2) # 2桁に揃える
  print ' '

  if date.wday.zero? # 日曜日の場合は改行を入れる
    puts
  end
end

puts # 最終日付の後に%が表示されてしまうので改行して防ぐ
