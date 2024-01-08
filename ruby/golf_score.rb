rules = gets.chomp.split(',')
players = gets.chomp.split(',')

SCORE_MAPPING = {
  4 => 'コンドル',
  3 => 'アルバトロス',
  2 => 'イーグル',
  1 => 'バーディ',
  0 => 'パー',
  -1 => 'ボギー',
}

for number in 0..17 do
  difference = rules[number].to_i - players[number].to_i

  score = SCORE_MAPPING[difference]
  score = difference <= -2 ? "#{difference * (-1)}ボギー" : SCORE_MAPPING[difference]

  # score = rules[number].to_i < 5 ? (players[number].to_i == 1 ?  'ホールインワン' : SCORE_MAPPING[difference]) : SCORE_MAPPING[difference];
  
  if rules[number].to_i < 5
    if players[number].to_i == 1
      score = 'ホールインワン'
    end
  end

  if number < 17
    print "#{score},"
  else
    print "#{score}\n"
  end
  number += 1
end
