class Vending_machine

  attr_reader :sales_amount, :drink_table

  # インスタンス生成時に空のハッシュを作ってstoreメソッドで必要個数分在庫を生成する
  def initialize
    @sales_amount = 0
    @drink_table = {}
    5.times { store(Drink.pepsi) }
    5.times { store(Drink.monster) }
    5.times { store(Drink.irohasu) }
  end

  # drinkにはインスタンスごと入れて操作すること　ex. Drink.pepsi
  def store(drink)
    if @drink_table.has_key?(drink.name)
      @drink_table[drink.name][:stock] += 1
    else
      @drink_table[drink.name] = { price: drink.price, stock: 1 }
    end
  end

  def purchasable?(drink)
    @drink_table.has_key?(drink.name) && @drink_table[drink.name][:stock] >= 1
  end

  def purchase(drink, ic_card)
    unless purchasable?(drink) == true && ic_card.total_amount >= drink_table[drink.name][:price]
      raise '在庫が不足しているかチャージ金額が足りていません。'
    end
    @drink_table[drink.name][:stock] -= 1
    @sales_amount += @drink_table[drink.name][:price]
    ic_card.total_amount -= @drink_table[drink.name][:price]
  end

  def inventory
    @drink_table.map {|name, info|
    [name, {price: info[:price], stock: info[:stock] }]
    }.to_h
  end

end

