class Drink

  # pepsi, monster, irohasu でメソッドを作り、指定されたらインスタンスを１個生成
  def self.pepsi
    self.new(:pepsi, 150)
  end

  def self.monster
    self.new(:monster, 230)
  end

  def self.irohasu
    self.new(:irohasu, 120)
  end

  def initialize(name, price)
    @name = name
    @price = price
  end

  def name
    @name
  end

  def price
    @price
  end
end

class Suica

  # 預け金の合計額は@@total_amount(クラス変数)として定義して、Vending_machineクラスと親子関係に設定することで変更できるようにする。
  def initialize(amount)
    @@total_amount = 0
    unless amount >= 100
      raise 'チャージ金額は100円から入金可能です。'
    end
    @@total_amount = amount + 500
  end

  def charge(amount)
    unless amount >= 100
      raise 'チャージ金額は100円から入金可能です。'
    end
    @@total_amount += amount
  end

  def deposit
    @@total_amount
  end

end

class Vending_machine < Suica

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
    unless @drink_table.has_key?(drink.name)
      @drink_table[drink.name] = { price: drink.price, stock: 1 }
    else
      @drink_table[drink.name][:stock] += 1
    end
  end

  def purchasable?(drink)
    @drink_table.has_key?(drink.name) && @drink_table[drink.name][:stock] >= 1 ? true : false
  end

  def purchase(drink)
    unless purchasable?(drink) == true && @@total_amount >= drink_table[drink.name][:price]
      raise '在庫が不足しているかチャージ金額が足りていません。'
    end
    @drink_table[drink.name][:stock] -= 1
    @sales_amount += @drink_table[drink.name][:price]
    @@total_amount -= @drink_table[drink.name][:price]
  end

  def drink_table
    @drink_table
  end

  def sales
    @sales_amount
  end

  def inventory
    @drink_table.map {|name, info|
    [name, {price: info[:price], stock: info[:stock] }]
    }.to_h
  end

end
