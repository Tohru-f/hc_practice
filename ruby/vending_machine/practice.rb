require_relative 'ic_card.rb'
require_relative 'drink.rb'
require_relative 'vending_machine.rb'

# 自動販売機を生成
test = Vending_machine.new
puts test.inventory

# ICカードの一つ目 nimoca を生成
nimoca = IC_card.new(200)
puts nimoca.total_amount

# ICカードの二つ目 sugoka を生成
sugoka = IC_card.new(200)

# irohasu が購入できるのか確認s
puts test.purchasable?(Drink.irohasu)

# pepsi, monster, irohasu を1本ずつnimocaで購入
test.purchase(Drink.pepsi, nimoca)
test.purchase(Drink.monster, nimoca)
test.purchase(Drink.irohasu, nimoca)

#自動販売機の在庫を確認
puts test.inventory

# pepsi, monster, irohasu を1本ずつsugokaで購入
test.purchase(Drink.pepsi, sugoka)
test.purchase(Drink.monster, sugoka)
test.purchase(Drink.irohasu, sugoka)

# pepsiを1本補充する
test.store(Drink.pepsi)

#自動販売機の在庫を確認
puts test.inventory

# nimocaとsugokaの残高を確認
puts nimoca.total_amount
puts sugoka.total_amount

# 売り上げ金額を確認
puts test.sales_amount
