require './item'

class Genre
  attr_reader :name, :id
  attr_accessor :items

  def initialize(name, id = rand(1..1000))
    @name = name
    @id = id
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_json(*_args)
    {
      name: @name,
      items: @items.map(&:id),
      id: @id
    }.to_json
  end
end
