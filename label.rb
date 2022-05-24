class Label
  attr_reader :items, :title, :color

  def initialize(title, color, id = rand(100_000), items = [])
    @id = id
    @title = title
    @color = color
    @items = items
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end

  def to_json(*_args)
    { id: @id, title: @title, color: @color, items: items }
  end
end
