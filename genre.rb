require './item'

class Genre
  attr_reader :name, :id
  attr_accessor :items

  def initialize(name)
    @name = name
    @id = rand(1..1000)
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
