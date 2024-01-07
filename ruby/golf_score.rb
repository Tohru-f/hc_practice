rules = gets.chomp.split(',')
players = gets.chomp.split(',')

for number in 0..17 do 
  difference = rules[number].to_i - players[number].to_i

  if rules[number].to_i == 5
    if players[number].to_i == 2
      score = "アルバトロス"
    elsif players[number].to_i == 1
      score = "コンドル"
    elsif difference == -1
      score = "ボギー"
    elsif difference <= -2
      score = "#{difference*(-1)}ボギー"
    elsif difference == 0
      score = "パー"
    elsif difference == 1
      score = "バーディ"
    elsif difference == 2
      score = "イーグル"
    end
  else
    if players[number].to_i == 1
      score = "ホールインワン"
    elsif difference == -1
      score = "ボギー"
    elsif difference <= -2
      score = "#{difference*(-1)}ボギー"
    elsif difference == 0
      score = "パー"
    elsif difference == 1
      score = "バーディ"
    elsif difference == 2
      score = "イーグル"
    end
  end

  if number < 17
    print "#{score},"
  elsif
    print "#{score}\n"
  end
  number += 1
end