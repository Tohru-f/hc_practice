class Drink

  attr_reader :name, :price

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

end