module CN

  def changeName(newName)
    if newName == 'うんこ'
      puts '不適切な名前です。'
      return
    end
    @name = newName
  end
end
