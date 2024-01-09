class Suica
  def initialize(val)
    @value = val + 500
  end

  def deposit
    @value
  end

  def charge(val)

    val < 100 ? puts 'チャージ金額は100円から入金可能です。' : @value += val 
    # if val < 100
    #   puts 'チャージ金額は100円から入金可能です。'
    # else
    #   @value += val
    # end
  end
end

suica = Suica.new(28)
puts suica.deposit
suica.charge(90)
puts suica.deposit