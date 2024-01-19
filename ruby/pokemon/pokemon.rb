# module CN

#   def changeName(newName)
#     if newName == 'うんこ'
#       puts '不適切な名前です。'
#       return
#     end
#     @name = newName
#   end
# end

class Pokemon

  private attr_reader :name
  attr_reader :type1, :type2, :hp

  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    puts "#{@name}のこうげき！"
  end

  def changeName(newName)
    if newName == 'うんこ'
      puts '不適切な名前です。'
      return
    end
    @name = newName
  end

  def name
    @name
  end
end

# class Pikachu < Pokemon

#   private attr_reader :name
#   attr_reader :type1, :type2, :hp

#   def attack
#     super
#     puts "#{@name} の10万ボルト!"
#   end

#   def name
#     super
#   end

# end

# class Player
#   include CN

#   private attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end
# end

# pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)
# pika.attack
# puts pika.name
# pika.changeName('うんこ')
# puts pika.name
# pika.changeName('ライチュウ')
# puts pika.name
# pika.attack

# player = Player.new('takeshi')
# puts player.name
# player.changeName('satoshi')
# puts player.name