class Pikachu < Pokemon

  private attr_reader :name
  attr_reader :type1, :type2, :hp

  def attack
    super
    puts "#{@name} の10万ボルト!"
  end

  def name
    super
  end

end
