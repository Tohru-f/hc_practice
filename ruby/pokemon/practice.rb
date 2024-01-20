require_relative 'pokemon'
require_relative 'pikachu'
require_relative 'player'
require_relative 'CN'
include CN

# ピカチュウのインスタンス生成
pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)

# ピカチュウで攻撃 親クラスと子クラスの攻撃メッセージを表示
pika.attack

# 現状のインスタンスで名前表示
puts pika.name

# うんこに名前を変えようとするが、不適切なので変更できない
pika.changeName('うんこ')

# 再度現状のインスタンスで名前表示　変わっていない
puts pika.name

# 名前をライチュウに変更
pika.changeName('ライチュウ')

# 変更後の名前を表示 + 攻撃メッセージ
puts pika.name
pika.attack

# Playerクラスでインスタンスを生成して、名前を表示
player = Player.new('takeshi')
puts player.name

# moduleからincludeした名前変更メソッドで名前を変えて表示
player.changeName('satoshi')
puts player.name