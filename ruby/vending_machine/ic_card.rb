class IC_card

  attr_reader :total_amount

  def initialize(amount)
    @total_amount = 0
    unless amount >= 100
      raise 'チャージ金額は100円から入金可能です。'
    end
    @total_amount = amount + 500
  end

  def charge(amount)
    unless amount >= 100
      raise 'チャージ金額は100円から入金可能です。'
    end
    @total_amount += amount
  end

  def total_amount=(value)
    @total_amount = value
  end

end
