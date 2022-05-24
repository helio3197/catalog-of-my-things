class Label
  attr_reader :items
  
  def initialize(title, color)
    @id = rand(100_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
