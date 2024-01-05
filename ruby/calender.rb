require 'date'
require 'optparse'

month = []
opt = OptionParser.new
opt.on('-m int'){|v| month << v.to_i}

opt.parse!(ARGV)
puts

dates = []
today = Date.today

if month.empty? #オプション指定がなかった場合
  first_date = Date.new(2024, today.month, 1)
  last_date = Date.new(2024, today.month, -1)

  first_date.upto(last_date) {|n| dates << n}

  print '      ' + first_date.month.to_s + '月' + ' ' + first_date.year.to_s

  puts
  print '月 火 水 木 金 土 日'
  puts 

  #スタート位置を初日の曜日を確認することで決める
  if first_date.wday == 0
    print '                  '
  elsif first_date.wday == 1
    print ''
  elsif first_date.wday == 2
    print '   '
  elsif first_date.wday == 3
    print '      '
  elsif first_date.wday == 4
    print '         '
  elsif first_date.wday == 5
    print '            '
  elsif first_date.wday == 6
    print '               '
  end

  #日付の出力
  dates.each do |date|
    if date.mday <= 9 #日付が一桁の場合は頭にスペースを入れる
      print ' '
    end
    
    print date.mday
    print ' '
    if date.wday == 0 #日曜日の場合は改行を入れる
      puts
    end
  end

elsif month[0].between?(1,12) #オプションの月が１〜１２月で正しく指定された場合
  first_date = Date.new(2024, month[0], 1)
  last_date = Date.new(2024, month[0], -1)

  first_date.upto(last_date) {|n| dates << n}

  print '      ' + first_date.month.to_s + '月' + ' ' + first_date.year.to_s

  puts
  print '月 火 水 木 金 土 日'
  puts 

  #スタート位置を初日の曜日を確認することで決める
  if first_date.wday == 0
    print '                  '
  elsif first_date.wday == 1
    print ''
  elsif first_date.wday == 2
    print '   '
  elsif first_date.wday == 3
    print '      '
  elsif first_date.wday == 4
    print '         '
  elsif first_date.wday == 5
    print '            '
  elsif first_date.wday == 6
    print '               '
  end

  #日付の出力
  dates.each do |date|
    if date.mday <= 9 #日付が一桁の場合は頭にスペースを入れる
      print ' '
    end
    
    print date.mday
    print ' '
    if date.wday == 0 #日曜日の場合は改行を入れる
      puts
    end
  end

else #指定されたオプションが１〜１２月を外れていた場合
  puts "#{month[0]} is neither a month number (1..12) nor a name"
end